//
// INPUT BUFFER
//
module cyclonev_io_ibuf (
   i,
   o,
   dynamicterminationcontrol,
   ibar
);
parameter    bus_hold          = "false";
parameter    differential_mode = "false";
parameter    lpm_type          = "cyclonev_io_ibuf";

input        i;
output       o;
input        dynamicterminationcontrol;
input        ibar;

assign o = i;

endmodule


//
// OUTPUT BUFFER
//
module cyclonev_io_obuf (
   i,
   o,
   obar,
   oe,
   dynamicterminationcontrol,
   parallelterminationcontrol,
   seriesterminationcontrol,
   devoe
);

parameter    bus_hold          = "false";
parameter    open_drain_output = "false";
parameter    lpm_type          = "cyclonev_io_obuf";

input        i;
output       o;
output       obar;
input        oe;
input        dynamicterminationcontrol;
input [15:0] parallelterminationcontrol;
input [15:0] seriesterminationcontrol;
input        devoe;

assign o    = oe ?  i : 1'bz;
assign obar = oe ? ~i : 1'bz;

endmodule
