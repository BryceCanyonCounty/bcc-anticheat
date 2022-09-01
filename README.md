# BCC Anti Cheat
> A RedM anti cheat and AFK system for Vorp

## Features
- Spam click auto kick
- AFK warning and auto kick
- Server Network check and auto kick
- Discord webhook integration
- Auto Cross Site Scripting (XSS) attack prevention on player connections
- Resource Injection Prevention
- Player Bad Behavior Prevention APIs
  - Profanity Filter for any string
  - String XSS Check

## How to install
* Download this repo
* Copy and paste `bcc-anticheat` folder to `resources/bcc-anticheat`
* Add `ensure <YOUR_RESOURCE_NAME>` to your `server.cfg` file
* Now you are ready to get coding!

## API Docs

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
