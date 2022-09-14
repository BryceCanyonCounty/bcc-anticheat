# BCC Anti Cheat
> A RedM anti-cheat and abuse prevention for Vorp

## Features
- Spam click auto kick
- **AFK** warning and auto kick
- Server Network check and auto kick
- Discord webhook integration
- Auto Cross Site Scripting (XSS) attack prevention on player connections
- Resource Injection Prevention
- Database Group check
- Resource Version Check API
  - Github Release(tag) based check
  - Github Version file based check
- Player Bad Behavior Prevention APIs for external scripts
  - Profanity Filter for any string
  - String XSS Check

## How to install
* Download this repo
* Copy and paste `bcc-anticheat` folder to `resources/bcc-anticheat`
* Add `ensure <YOUR_RESOURCE_NAME>` to your `server.cfg` file
* Now you are ready to get coding!

## API Docs

### Version Check

This API will allow you to add a version check to your resource.

#### Release(Tag) Based Checks

_Hot to use [Github Releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)_

> Create a Release and tag  with the version number

_Correct: `1.0.0`_

_Wrong: `v1.1.0`_

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
- Potentially migrate player state flags for net, and afk to statebags
- Open to suggestions!

## Need More Support? 
- [Vorp Disord](https://discord.gg/DHGVAbCj7N)

## Requirements
- [VORP-Core](https://github.com/VORPCORE/VORP-Core/releases)
