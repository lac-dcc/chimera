// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps


module MUX_ARRAY
    #(
      parameter N = 2,
      parameter BITS_IMAGEN = 8,
      parameter BITS_DATA = 13,
      parameter STATES = 3,
      localparam SUB = N/2 + 1 //para N par, numero de estados de direccionamiento de memoria
      )(
        input [N*BITS_DATA-1:0]      i_DataConv,
        input [(N+2)*BITS_DATA-1:0]  i_MemData,
        input [BITS_IMAGEN-1:0]      i_Data,

        input [clog2(STATES-1)-1:0]  i_state,
        input [clog2(N/2) - 1:0]     i_substate, //PARA N PAR
        input [clog2(N+1)-1:0]       i_memSelect, //Elige memoria para escribir / leer
        output [N*3*BITS_IMAGEN-1:0] o_DataConv,
        //output reg [3*N*BITS_IMAGEN-1:0] o_DataConv,
        output [(N+2)*BITS_DATA-1:0] o_MemData,
        output [BITS_DATA-1:0]       o_Data
    );
    
    wire [BITS_DATA-1:0]             to_memory [0:N+1];
    wire [3*BITS_IMAGEN-1:0]         to_conv [0:N-1];
    wire [3*BITS_IMAGEN-1:0]         to_inputmuxconv [0:N-1][0:2**(clog2(N/2))-1];
    
    wire [BITS_DATA-1:0]                         from_conv [0:N+1]; //dos de mas para las 2 memorias de mas
    wire [BITS_DATA-1:0]                         from_memory[0:N+1];
    wire [BITS_DATA-1:0]                         to_muxmem[0:N+1];
    wire [BITS_DATA-1:0]                         to_inputmuxmem [0:N+1][0:2**(clog2(N/2))-1];

    generate
        genvar                           x, z;
        //integer                          conv_ptr;
        for (x = 0; x < N+2; x = x+1) begin
            //Salida memoria
            for (z = 0; z <= {clog2(N/2){1'b1}}; z = z+1) begin
                if (z < N/2+1)
                    assign to_inputmuxmem[x][z] = from_conv[(2*z+x) % (N+2)];
                else
                    assign to_inputmuxmem[x][z] = {BITS_DATA{1'b0}};
            end
            assign to_muxmem[x] = to_inputmuxmem[x][i_substate];

            assign from_memory[x] = i_MemData[BITS_DATA*(x+1)-1 -: BITS_DATA];
            assign to_memory[x] = (i_state == 2'b00) ? {{(BITS_DATA-BITS_IMAGEN){1'b0}}, i_Data} : to_muxmem[x];
            assign o_MemData[BITS_DATA*(x+1)-1 -: BITS_DATA] = to_memory[x];

        end
        
    endgenerate
    

    generate
        genvar                           i;
        for (i = 0; i < N; i = i+1) begin
            genvar j;
            //Salida a convolucionador
            for (j = 0; j <= {clog2(N/2){1'b1}}; j = j+1) begin
                if(j < N/2+1)
                    assign to_inputmuxconv[i][j] = {
                                                    from_memory[(N*j+i+2) % (N+2)][BITS_IMAGEN-1:0],
                                                    from_memory[(N*j+i+1) % (N+2)][BITS_IMAGEN-1:0],
                                                    from_memory[(N*j+i) % (N+2)][BITS_IMAGEN-1:0]
                                                    };
                else
                    assign to_inputmuxconv[i][j] = {3*BITS_IMAGEN{1'b0}};
            end

            assign to_conv[i] = to_inputmuxconv[i][i_substate];
            assign from_conv[i] = i_DataConv[BITS_DATA*(i+1)-1 -: BITS_DATA];
            assign o_DataConv[3*BITS_IMAGEN*(i+1)-1 -: 3*BITS_IMAGEN] = to_conv[i];
        end
        assign from_conv[N] = {BITS_DATA{1'b0}};
        assign from_conv[N+1] = {BITS_DATA{1'b0}};
    endgenerate
    

    assign o_Data = from_memory[i_memSelect];

    function integer clog2;
        input integer depth;
        for (clog2=0; depth>0; clog2=clog2+1)
            depth = depth >> 1;
    endfunction

endmodule

