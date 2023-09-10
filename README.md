# BCC Anti Cheat
> A RedM anti-cheat and abuse prevention for Vorp

## Features
- Spam click auto kick
- **AFK** warning and auto kick
- Server Network check and auto kick
- Discord webhook integration
  - Discord export API
- Auto Cross Site Scripting (XSS) attack prevention on player connections
- Resource Injection Prevention
- Database Group check
- Speed (Time) Check
- Resource Version Check export APIs
  - Github Release(tag) based check
  - Github Version file based check
- Player Bad Behavior Prevention export APIs for external scripts
  - Profanity Filter for any string
  - String XSS Check
- Blacklist Option
  - Anti Spawn Blacklist Object
  - Anti Spawn Blacklist Weapon
  - Anti Health Hack

## How to install
* Download this repo
* Copy and paste `bcc-anticheat` folder to `resources/bcc-anticheat`
* Add `ensure <YOUR_RESOURCE_NAME>` to your `server.cfg` file
* Now you are ready to get coding!

## API Docs

### Version Check

This API will allow you to add a version check to your resource.

#### Release(Tag) Based Checks

_How to use [Github Releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)_

> Create a Release and tag  with the version number

_Correct: `1.0.0`_

_Wrong: `v1.0.0`_

> Add the following contents to your lua server
```lua
local versioner = exports['bcc-anticheat'].versioner()
local repo = 'https://github.com/VORPCORE/vorp_inventory-lua
versioner.checkRelease(GetCurrentResourceName(), repo)
```

#### Version File Based Checks

> Create a file called `version` with the following contents
```txt
<1.3>
- More awesome updates
<1.1>
- Some awesome updates
<1.0>
- My first Update
```


> Add the following contents to your lua server
```lua
local versioner = exports['bcc-anticheat'].versioner()
local repo = 'https://github.com/VORPCORE/
versioner.checkFile(GetCurrentResourceName(), repo)
```

### Profanity Filter

```lua
local mystring = 'What the crap is this mouse'
local filter = '*****'

local profanity = exports['bcc-anticheat'].profanity()
local cleaned = profanity.filter(mystring, filter)

print(cleaned)
-- prints out: "What the ****"
```

### Add to Profanity Filter per script
```lua
local mystring = 'What the crap is this mouse'
local filter = '*****'

local profanity = exports['bcc-anticheat'].profanity()

profanity.addToList({
    'sad',
    'cat',
    'mouse'
})

local cleaned = profanity.filter(mystring, filter)

print(cleaned)
-- prints out: "What the **** is this ****"
```

### Discord Webhooks

This API allows you to easily add [Discord webhooks](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) messages to your scripts.

#### SendMessage
```lua
local discord = exports['bcc-anticheat'].discord()

discord.sendMessage('webhookurl', 'My Script', 'https://cdn2.iconfinder.com/data/icons/frosted-glass/256/Danger.png', 'user123', 'this user is awesome')
```

#### embeds
> Add custom [embeds](https://birdie0.github.io/discord-webhooks-guide/discord_webhook.html)
```lua
local discord = exports['bcc-anticheat'].discord()

discord.sendMessage('webhookurl', 'My Script', 'https://cdn2.iconfinder.com/data/icons/frosted-glass/256/Danger.png', 'user123', 'this user is awesome'{
  {
    {
      color = 11342935,
      title = 'some times',
      description = 'awesomesauce'
    },
   {
      color = 11342935,
      title = 'some other time',
      description = 'awesomesauce'
    },
  }
})
```


### XSS String Check
[Cross Site Scripting Prevention (XSS)](https://en.wikipedia.org/wiki/Cross-site_scripting)
```lua
local mystring = '<iframe src="badactor"></iframe>'

local stringy = exports['bcc-anticheat'].strings()
local isxss = stringy.xss(mystring)

print(isxss)
-- prints out: true
```

## TODO:
- Add other commonly exploited key spams
- Detect Menus better
- Multi-Framework support
- Open to suggestions!