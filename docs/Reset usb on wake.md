# Reset USB on wake

My keyboard doesn't power on after sleep. Since I'm on linux there's probably also no software for it, no clue if there would be driver updates. I instead just wanted to find a small hack to reset power to usb after waking.

## Step 1) Install usb_resetter

See [https://github.com/netinvent/usb_resetter](https://github.com/netinvent/usb_resetter)

I installed it to `/usr/local/bin/usb_resetter`

## Step 2) Set up systemd event

Create the following script at `/usr/lib/systemd/system-sleep/resetusb`:

```sh
#!/bin/sh
case $1 in
  post)
    /usr/local/bin/usb_resetter --reset-all
  ;;
esac
```

## Step 3) Test it :)