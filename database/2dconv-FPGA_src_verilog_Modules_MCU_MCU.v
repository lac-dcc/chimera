// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

module MCU
    #(
      parameter N = 16,
      parameter STATES = 3,
      parameter BITS_IMAGEN = 8,
      parameter BITS_DATA = 13,
      parameter BITS_ADDR = 10
      )(
        input [N*BITS_DATA-1:0]        i_DataConv,
        input [BITS_IMAGEN-1:0]        i_Data,
        input [(N+2)*BITS_DATA-1:0]    i_MemData,
        input [BITS_ADDR-1:0]          i_WAddr, i_RAddr,
        input                          i_chblk, i_sop, i_eop, rst, clk,

        output [3*N*BITS_IMAGEN-1:0]   o_DataConv,
        output [BITS_DATA-1:0]         o_Data,
        output [N+1:0]                 o_we,
        output [BITS_ADDR-1:0]         o_WAddr, o_RAddr,
        output [(N+2)*BITS_DATA-1:0] o_MemData
        );

    wire [clog2(STATES-1)-1:0]         state;
    wire [clog2(N/2)-1: 0]             substate;
    wire [clog2(N+1)-1:0]              memSelect;
    
    assign o_WAddr = i_WAddr;  //Direcciones van derecho, replicarlas en caso de problemas con fanout
    assign o_RAddr = i_RAddr;
    
    MUX_ARRAY
        #(
          .N(N),
          .BITS_IMAGEN(BITS_IMAGEN),
          .BITS_DATA(BITS_DATA),
          .STATES(STATES)
          )
    
    u_MUX_ARRAY
        (
         .i_DataConv(i_DataConv),
         .i_MemData(i_MemData),
         .i_Data(i_Data),
         .i_state(state),
         .i_substate(substate),
         .i_memSelect(memSelect),
         .o_DataConv(o_DataConv),
         .o_MemData(o_MemData),
         .o_Data(o_Data)
         );

    MCU_CTRL
        #(
          .N(N),
          .STATES(STATES)
          )

    u_MCU_CTRL
        (
         .i_sop(i_sop),
         .i_eop(i_eop),
         .i_chblk(i_chblk),
         .clk(clk),
         .rst(rst),

         .o_we(o_we),
         .o_state(state),
         .o_substate(substate),
         .o_memSelect(memSelect)
         );

    function integer clog2;
        input integer                  depth;
        for (clog2=0; depth>0; clog2=clog2+1)
            depth = depth >> 1;
    endfunction

endmodule