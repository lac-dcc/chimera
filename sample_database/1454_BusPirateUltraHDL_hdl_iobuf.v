// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

//------------------------------------------------------------------
//-- Input/output buffer control
//-- Uses two output pins and one tristate pin
//-- The 3 controls of the tristate pin need to be exposed in the top module and passed individually
//-- 74LVC1T45 is a bidirectional buffer. LOW is input to FPGA and HiZ on IO header
//-- 74LVC1G07 is an open drain output buffer. HIGH is HiZ, LOW is GND
//--
//------------------------------------------------------------------
`ifndef __IOBUF__
`define __IOBUF__
module iobuf (
      //interface
      input wire oe, //output enable 1=true
      input wire od, //open drain 1=true
      input wire dir,//direction 1=input
      input wire din,//data in (value when buffer is output)
      output wire dout,//data out (value when buffer is input)
      //hardware driver
      output wire bufdir, //74LVC1T45 DIR pin LOW for Hi-Z
      output wire bufod, //74LVC1G07 OD pin HIGH for Hi-Z
      output wire bufdat_tristate_oe, //tristate data pin output enable
      output wire bufdat_tristate_dout, //tristate data pin data out
      input wire bufdat_tristate_din  //tristate data pin data in
    );

    assign dout=bufdat_tristate_din;        //D6 tristate data pin data in (should track D3)
    assign bufdir=(oe&&!od&&!dir)?1'b1:1'b0; //D5 74LVC1T45 direction pin H=1=output, L=0=input
    assign bufod=(oe&&od)?din:1'b1;         //D4 74LVC1G07 open drain H=HiZ, L=GND
    assign bufdat_tristate_oe = (oe&&!od&&!dir)?1'b1:1'b0;     //D3 tristate data pin output enable H=1=output L=0=input
    assign bufdat_tristate_dout = din;      //D3 tristate data pin data out value (1 or 0)

endmodule
`endif
