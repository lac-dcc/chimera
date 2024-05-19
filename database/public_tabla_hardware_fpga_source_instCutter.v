// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

/* 
 * Instruction Format
 * Fn | dest0 | dest1 | dest2 | src0 | src1 | src2
 */
 
 `timescale 1ns/1ps
 
module instCutter #(
    parameter destNum = 3, //only can write to GRADIENT, WEIGHT, INTERIM, BUS_SYSTEM, NEIGBOURS
    parameter srcNum = 3,
    parameter fnLen = 3,
    parameter nameLen = 3,
    parameter indexLen = 8,
    parameter instLen = fnLen + nameLen*destNum + nameLen*srcNum + indexLen*(srcNum+destNum)
//--------------------------------------------------------------------------------------
)(
	instword,
	instword_v,
	
	fn,
	
	dest0Name,
	dest0Index,

	dest1Name,
	dest1Index,
	
	dest2Name,
	dest2Index,

	src0Name,
	src0Index,

	src1Name,
	src1Index,

	src2Name,
	src2Index
);

	//--------------------------------------------------------------------------------------


	//--------------------------------------------------------------------------------------
	input[instLen - 1: 0] instword;
	input instword_v;
	output[fnLen - 1: 0] fn;
	output[nameLen - 1: 0]  dest0Name;
	output[indexLen - 1: 0] dest0Index;
	output[nameLen - 1: 0]  dest1Name;
	output[indexLen - 1: 0] dest1Index;
	output[nameLen - 1: 0]  dest2Name;
	output[indexLen - 1: 0] dest2Index;
	output[nameLen - 1: 0]  src0Name;
	output[indexLen - 1: 0] src0Index;
	output[nameLen - 1: 0]  src1Name;
	output[indexLen - 1: 0] src1Index;
	output[nameLen - 1: 0]  src2Name;
	output[indexLen - 1: 0] src2Index;
	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	assign fn = instword [ 6*(indexLen + nameLen) + fnLen - 1 : 6*(indexLen + nameLen) ];
	
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
	assign src2Index = instword [indexLen - 1 : 0] & {indexLen{instword_v}};
	//--------------------------------------------------------------------------------------
	
endmodule
