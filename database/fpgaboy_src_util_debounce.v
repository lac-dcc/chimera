// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

module debounce (reset, clock, noisy, clean);
  parameter DELAY = 333333;   // .01 sec with a 33.3333Mhz clock
  input reset, clock, noisy;
  output clean;
  
  reg [18:0] count;
  reg new, clean;
  
  always @(posedge clock)
    if (reset)
    begin
      count <= 0;
      new <= noisy;
      clean <= noisy;
    end
    else if (noisy != new)
    begin
      new <= noisy;
      count <= 0;
    end
    else if (count == DELAY)
      clean <= new;
    else
      count <= count+1;

endmodule
