Add-Type -AssemblyName System.Speech

$Speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer

$Speaker.SelectVoice('Microsoft Zira Desktop')
$Speaker.Rate = 5

$PathForFile = Join-Path -Path $env:USERPROFILE -ChildPath "Desktop\YTUBE\PSSpeech\MyTalk.wav"

$Speaker.SetOutputToWaveFile($PathForFile)

$TextToSpeak = 'Say something nice for me!'

$Speaker.Speak($TextToSpeak)

$Speaker.Dispose()