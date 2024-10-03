## Usage

```lua
require "reactivity"
```

### Create a new reactive variable

```lua
initreactive("counter", 0, function(value)
    print("Counter changed to "..value)
end)

print(counter) --> 0
counter = counter + 1 --> Counter changed to 1
```

### Make an existing variable reactive

```lua
counter = 0

makereactive("counter", function(value)
    print("Counter changed to "..value)
end)

print(counter) --> 0
counter = counter + 1 --> Counter changed to 1
```
