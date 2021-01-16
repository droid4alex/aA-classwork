class Clock {
    constructor() {
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
        let current_date = new Date();
        this.hr = current_date.getHours();
        this.min = current_date.getMinutes();
        this.sec = current_date.getSeconds();
        
      setInterval(this._tick.bind(this), 1000);
        }
    
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
      let timeString = `${this.hr} : ${this.min} : ${this.sec}`;
      console.log(timeString)
    }
    // military time  12am == 00:00:00        11:59pm == 23:59:59
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      this.sec++;
      if (this.sec === 60) {
        this.min++;
        this.sec = 0;
      }
      if (this.min === 60){
        this.hr = (this.hr + 1) % 24;
        this.min = 0;
      }
      this.printTime();
    // setInterval(function printTime(){
    //     let timeString = `${this.hr} : ${this.min} : ${this.sec}`;
    //     console.log(timeString)
    // }, 1000)
    }
    }
  
  const clock = new Clock();

  // clock._tick();