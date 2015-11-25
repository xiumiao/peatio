pusher = new Pusher gon.pusher.key,
  encrypted: gon.pusher.encrypted
  wsHost: gon.pusher.wsHost
  wsPort: gon.pusher.wsPort
  wssPort: gon.pusher.wssPort
  disableFlash: !0
  disableStats: !0
  enabledTransports: ['ws']
  disabledTransports: ["flash","sockjs"]

window.pusher = pusher
