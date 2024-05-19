// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

module tb_MUX_ARRAY();
    
    parameter N = 4;
    parameter BITS_IMAGEN = 8;
    parameter STATES = 3;
    parameter BITS_DATA = 13;

    
    reg [N*BITS_DATA-1:0]          i_DataConv;
    reg [(N+2)*BITS_DATA-1:0]      i_MemData;
    reg [BITS_IMAGEN-1:0]              i_Data;

    reg [clog2(STATES-1)-1:0]         i_state;
    reg [clog2(N/2) - 1:0]     i_substate; //PARA N PAR
    
    reg [clog2(N+1)-1:0]            i_memSelect;

    wire [3*N*BITS_IMAGEN-1:0]       o_DataConv;
    wire [(N+2)*BITS_DATA-1:0]     o_MemData;
    wire [BITS_DATA-1:0]               o_Data;
    

    initial begin
    
        $display("%d", 2**clog2(N/2));
        i_Data     = {BITS_IMAGEN{1'b1,1'b0}};
        i_MemData  = {13'b0, 13'b1, 13'b0, 13'b1};
        i_DataConv = {13'h3,13'h2,13'h1,13'h0};
        
        i_state     = 0;
        i_substate  = 0;
        i_memSelect = 0;
        
        #100 i_memSelect = 1;
        #200 i_memSelect = 2;
        #300 i_memSelect = 3;
        
        #350 i_state = 1;
        #500 i_substate = 1;
        
        #600 i_state  = 2;
             i_memSelect = 0;
        #650 i_memSelect = 1;
        #700 i_memSelect = 2;
        
        #800 $finish;

    end

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
         .i_state(i_state),
         .i_substate(i_substate),
         .i_memSelect(i_memSelect),
         .o_DataConv(o_DataConv),
         .o_MemData(o_MemData),
         .o_Data(o_Data)
         );
             
             
        function integer clog2;
             input integer depth;
             for (clog2=0; depth>0; clog2=clog2+1)
                 depth = depth >> 1;
         endfunction
         
endmodule
