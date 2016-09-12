class Notify {
  constructor(ws_url) {
    this.ws = new WebSocket(ws_url); // 'ws://localhost:8080'
    this.events = {}

    this.ws.onmessage = (msg) => {
      var data = JSON.parse(msg.data)
      this.trigger(data.channel, data.data)
    }
  }

  on(channel_name, handler) {
    if (this.events[channel_name] === undefined) {
      this.events[channel_name] = []
    }
    this.events[channel_name].push(handler)
  }

  off(channel_name, handler) {
    this.events[channel_name] = _.without(this.events[channel_name], handler)
  }

  trigger(channel_name, data) {
    this.events[channel_name].forEach((handler) => handler(data))
  }
}
