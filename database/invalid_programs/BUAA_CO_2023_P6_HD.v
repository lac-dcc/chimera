// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

`include "Defines.v"

module HD (
    input wire [1:0] Rs_Tuse,
    input wire [4:0] Rs_Addr,
    input wire [1:0] Rt_Tuse,
    input wire [4:0] Rt_Addr,
    input wire [3:0] D_MulDivOp,
    input wire [1:0] E_Tnew,
    input wire [4:0] E_Reg_WA,
    input wire E_MulDiv_busy,
    input wire [1:0] M_Tnew,
    input wire [4:0] M_Reg_WA,
    output wire stall
);
    /*
        Hazard Detection Unit
    */
    
    wire stall_rs, stall_rt;
    wire stall_rs_e, stall_rs_m;
    wire stall_rt_e, stall_rt_m;
    wire stall_HILO;

    assign stall_rs_e = (Rs_Tuse < E_Tnew) && (Rs_Addr && (Rs_Addr == E_Reg_WA));
    assign stall_rs_m = (Rs_Tuse < M_Tnew) && (Rs_Addr && (Rs_Addr == M_Reg_WA));
    assign stall_rt_e = (Rt_Tuse < E_Tnew) && (Rt_Addr && (Rt_Addr == E_Reg_WA));
    assign stall_rt_m = (Rt_Tuse < M_Tnew) && (Rt_Addr && (Rt_Addr == M_Reg_WA));

    assign stall_rs = stall_rs_e || stall_rs_m;
    assign stall_rt = stall_rt_e || stall_rt_m;

    assign stall_HILO = E_MulDiv_busy && D_MulDivOp;

    assign stall = stall_rs || stall_rt || stall_HILO;
endmodule