// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

module overvoltage_dig (
input VPWR, 
input VGND, 
input otrip, 
output otrip_decoded
);

wire VPWR;
wire VGND;
wire otrip;
wire otrip_decoded;

 sky130_fd_sc_hd__buf_2 output0 (.A(otrip),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(otrip_decoded));

endmodule
