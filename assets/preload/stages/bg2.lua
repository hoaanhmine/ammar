function onCreate()

	makeLuaSprite('bg3','bg3',-400,0)
	setGraphicSize('bg3', getProperty('bg3.width') * 1.4);
	addLuaSprite('bg3')

	makeLuaSprite('bg2','bg2',-400,-200)
	setGraphicSize('bg2', getProperty('bg2.width') * 1.4);
	addLuaSprite('bg2')

	makeLuaSprite('bg1','bg1',-400,0)
	setGraphicSize('bg1', getProperty('bg1.width') * 1);
	addLuaSprite('bg1')

	makeLuaSprite('hudlight','hudlight',0,0)
	setObjectCamera('hudlight', 'camHUD')
	setBlendMode('hudlight', 'screen')
	addLuaSprite('hudlight')

	makeLuaSprite('hudvingette','hudvingette',0,0)
	setObjectCamera('hudvingette', 'camHUD')
	addLuaSprite('hudvingette')
	
	addCharacterToList('scooblack', 'dad')
	addCharacterToList('scoobshow', 'dad')
	addCharacterToList('ogs', 'dad')
	addCharacterToList('velmashow', 'bf')
	
	setObjectOrder('bg1', 1)
	setObjectOrder('bg2', 2)
	setObjectOrder('bg3', 3)
	setObjectOrder('bg4', 4)
	setObjectOrder('dadGroup', 5)
	setObjectOrder('boyfriendGroup', 6)
	

	setProperty('bg2.visible', false)
	setProperty('bg3.visible', false)
	setProperty('boyfriend.visible', true)
	setProperty('dad.visible', true)
	
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'dead');

	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end

function onBeatHit()
	if curBeat == 128 then
		setProperty('bg2.visible', true)

		triggerEvent('Change Character', 'dad', 'darwinfire')
		cameraFlash('game', 'FFFFFF', crochet / 1000)

		setProperty('boyfriend.visible', false)
		setProperty('dad.visible', true)
	end
	
	if curBeat == 192 then
		setProperty('bg3.visible', true)
		
		triggerEvent('Change Character', 'dad', 'ogs')
		cameraFlash('game', 'FFFFFF', crochet / 1000)
	end
	
	if curBeat == 320 then
		setProperty('bg3.visible', false)
		
		triggerEvent('Change Character', 'dad', 'darwinfire')
		cameraFlash('game', 'FFFFFF', crochet / 1000)
	end
end

function onCreatePost()
	if not middleScroll then
		for i in 0,3 do
	    setPropertyFromGroup('opponentStrums', i, 'visible', false);
			setPropertyFromGroup('playerStrums', i, 'x', defaultPlayerStrumX0 - (320 * (i + 1)));
		end
	end
end