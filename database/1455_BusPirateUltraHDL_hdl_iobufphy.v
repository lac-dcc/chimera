// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

//------------------------------------------------------------------
//-- Input/output buffer hardware physical layer simulation
//-- Very stupid simulation to easily spot pin behavior
//-- Basic contention detection when 74LVC1T45 is input and FPGA pin is set to output
//-- 74LVC1T45 is a bidirectional buffer. LOW is input to FPGA and HiZ on IO header
//-- 74LVC1G07 is an open drain output buffer. HIGH is HiZ, LOW is GND
//--
//------------------------------------------------------------------
`ifndef __IOBUFPHY__
`define __IOBUFPHY__
module iobufphy (
      //interface
      output wire iopin_state, //is pin 0/1/HiZ?
      output wire iopin_contention, //if buffer direction is input and pin is output this is a problem!!
      input wire iopin_input, //put your test values here to simulate external stimulation of the buffer
      //hardware driver
      input wire bufdir, //74LVC1T45 DIR pin LOW for Hi-Z
      input wire bufod, //74LVC1G07 OD pin HIGH for Hi-Z
      inout wire bufio //tristate data pin
    );
    wire input_value;

    assign input_value = bufio;
    assign bufio = (bufdir==1'b0)? iopin_input : 1'bz;

    assign iopin_state=(!bufdir && bufod)?iopin_input:(!bufdir&&!bufod)?1'b0:input_value;
    assign iopin_contention=(!bufdir&&bufio!==1'bz); //if dir is low and fpga pin is output, then contention!!!!


endmodule
`endif
