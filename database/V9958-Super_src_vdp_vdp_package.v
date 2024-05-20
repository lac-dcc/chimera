// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

package custom_timings;
  function [9:0] CLOCKS_PER_HALF_LINE;
    input PAL_MODE;
    begin
      if (PAL_MODE) CLOCKS_PER_HALF_LINE = 864;  // Return this value if PAL_MODE is set
      else CLOCKS_PER_HALF_LINE = 858;  // Return this value if PAL_MODE is not set
    end
  endfunction

  function [9:0] FRAME_WIDTH; //alias for CLOCKS_PER_HALF_LINE
    input PAL_MODE;
    begin
      if (PAL_MODE) FRAME_WIDTH = 864;  // Return this value if PAL_MODE is set
      else FRAME_WIDTH = 858;  // Return this value if PAL_MODE is not set
    end
  endfunction

  function [9:0] FRAME_HEIGHT;
    input PAL_MODE;
    begin
      if (PAL_MODE) FRAME_HEIGHT = 625;  // Return this value if PAL_MODE is set
      else FRAME_HEIGHT = 525;  // Return this value if PAL_MODE is not set
    end
  endfunction

  function [9:0] PIXEL_WIDTH; //alias for CLOCKS_PER_HALF_LINE
    PIXEL_WIDTH = 720;  // Both 50 and 60hz modes have the same pixel width
  endfunction

  function [9:0] PIXEL_HEIGHT;
    input PAL_MODE;
    begin
      if (PAL_MODE) PIXEL_HEIGHT = 576;  // Return this value if PAL_MODE is set
      else PIXEL_HEIGHT = 480;  // Return this value if PAL_MODE is not set
    end
  endfunction

`define MAX_PIXEL_WIDTH 720

endpackage
