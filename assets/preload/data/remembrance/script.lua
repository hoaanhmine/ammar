-- entire script made by fyrid

cardimage = 'fishyCard' -- your image name
duration = 3 -- time it appears for
stayTime = 2.5 -- time it stays for
ease = 'circIn' -- tween ease for when it leaves
textfont = 'vcr.ttf' -- song card text font
composername = '' -- song creator goes here
remixedname = '' -- remix creator goes here
spritesname = '' -- remix creator goes here
composerCards = false

function onCreate()
    makeLuaSprite('songCardSprite', cardimage, 0, 150)
    --addLuaSprite('songCardSprite', true)

    makeLuaText('songNameTxt', songName, 0, 0, 145)
    setTextFont('songNameTxt', textfont)
    setTextSize('songNameTxt', 60)
    addLuaText('songNameTxt')

    makeLuaText('composerNameTxt', 'Composer - CheeseWithCake' .. composername, 0, 0, 198)
    setTextFont('composerNameTxt', textfont)
    setTextSize('composerNameTxt', 18)
    addLuaText('composerNameTxt')

    makeLuaText('remixedNameTxt', 'Remixed and Coder - DJtrix' .. remixedname, 0, 0, 218)
    setTextFont('remixedNameTxt', textfont)
    setTextSize('remixedNameTxt', 18)
    addLuaText('remixedNameTxt')

    makeLuaText('spritesNameTxt', 'Sprites - Angelous' .. remixedname, 0, 0, 238)
    setTextFont('spritesNameTxt', textfont)
    setTextSize('spritesNameTxt', 18)
    addLuaText('spritesNameTxt')

    setObjectCamera('songCardSprite', 'other')
    setObjectCamera('songNameTxt', 'other')
    setObjectCamera('composerNameTxt', 'other')
    setObjectCamera('remixedNameTxt', 'other')
    setObjectCamera('spritesNameTxt', 'other')

    runTimer('cardTimer', stayTime, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'cardTimer' then
        songCardLeave()
    end
end

function songCardLeave()
    doTweenX('cardTween', 'songCardSprite', -1000, duration, ease)
    doTweenX('cardTween2', 'songNameTxt', -1000, duration, ease)
    doTweenX('cardTween3', 'composerNameTxt', -1000, duration, ease)
    doTweenX('cardTween4', 'remixedNameTxt', -1000, duration, ease)
    doTweenX('cardTween5', 'spritesNameTxt', -1000, duration, ease)
end