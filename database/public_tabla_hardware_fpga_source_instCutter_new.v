/* 
 * Instruction Format
 * Fn | dest0 | dest1 | dest2 | src0 | src1 | src2
 */
 
 `timescale 1ns/1ps
 
module instCutter_new #(
    parameter fnLen = 3,
    parameter nameLen = 3,
    parameter indexLen = 8,
    parameter weightAddrLen         = 5,
	  parameter interimAddrLen        = 2,
    parameter peBusIndexLen         = 4,
  	parameter gbBusIndexLen         = 4,

    parameter instLen = fnLen + (indexLen+nameLen)*2 + 1+interimAddrLen+1+weightAddrLen+1+1+peBusIndexLen+gbBusIndexLen
//--------------------------------------------------------------------------------------
)(
  input [instLen - 1: 0]      instword,
  input                       instword_v,

  output [fnLen-1:0]          fn,
  
  output                      dest_weight_wrt,
  output [weightAddrLen-1:0]  dest_weight_Index,
	
  output                      dest_interim_wrt,
  output [interimAddrLen-1:0] dest_interim_Index,

  output                      dest_pe_bus_wrt,
  output                      dest_gb_bus_wrt,
  output [peBusIndexLen-2:0]  dest_pe_bus_Index,
  output [gbBusIndexLen-2:0]  dest_gb_bus_Index,

  output                      dest_pe_neigh_wrt,
  output                      dest_pu_neigh_wrt,

  output[nameLen - 1: 0]      src0Name,
	output[indexLen - 1: 0]     src0Index,
	output[nameLen - 1: 0]      src1Name,
	output[indexLen - 1: 0]     src1Index 

);

	//--------------------------------------------------------------------------------------

  assign {fn,src0Name,src0Index,src1Name,src1Index,dest_interim_wrt,dest_interim_Index,dest_weight_wrt,dest_weight_Index,dest_pu_neigh_wrt,dest_pe_neigh_wrt,dest_pe_bus_wrt,dest_pe_bus_Index,dest_gb_bus_wrt,dest_gb_bus_Index} = instword;
	//--------------------------------------------------------------------------------------
	/*assign fn = instword [ 6*(indexLen + nameLen) + fnLen - 1 : 6*(indexLen + nameLen) ];
	
	assign dest0Name = instword [ 6*(indexLen + nameLen) - 1 : 6*indexLen + 5*nameLen ] & {nameLen{instword_v}};
	assign dest0Index = instword [ 6*indexLen + 5*nameLen - 1 : 5*(indexLen + nameLen) ] & {indexLen{instword_v}};
	
	assign dest1Name = instword [ 5*(indexLen + nameLen) - 1 : 5*indexLen + 4*nameLen ] & {nameLen{instword_v}};
	assign dest1Index = instword [ 5*indexLen + 4*nameLen - 1 : 4*(indexLen + nameLen) ] & {indexLen{instword_v}};
	
	assign dest2Name = instword [ 4*(indexLen + nameLen) - 1 : 4*indexLen + 3*nameLen ] & {nameLen{instword_v}};
	assign dest2Index = instword [ 4*indexLen + 3*nameLen - 1 : 3*(indexLen + nameLen) ] & {indexLen{instword_v}};
	
	assign src0Name = instword [ 3*(indexLen + nameLen) - 1 : 3*indexLen + 2*nameLen ] & {nameLen{instword_v}};
	assign src0Index = instword [ 3*indexLen + 2*nameLen - 1 : 2*(indexLen + nameLen) ] & {indexLen{instword_v}};
	
	assign src1Name = instword [ 2*(indexLen + nameLen) - 1 : 2*indexLen + nameLen ] & {nameLen{instword_v}};
	assign src1Index = instword [ 2*indexLen + nameLen - 1 : indexLen + nameLen ] & {indexLen{instword_v}};
	
	assign src2Name = instword [ indexLen + nameLen - 1 : indexLen ] & {nameLen{instword_v}};
	assign src2Index = instword [indexLen - 1 : 0] & {indexLen{instword_v}};*/
	//--------------------------------------------------------------------------------------
	
endmodule
