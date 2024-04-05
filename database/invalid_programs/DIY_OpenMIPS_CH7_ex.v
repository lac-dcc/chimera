`include "defines.v"

module ex(
    input  wire                      reset,
    
    input  wire[`ALUOpBus]           aluop_input,
    input  wire[`ALUSelBus]          alusel_input,
    input  wire[`RegisterBus]        instruction_input,

    input  wire[`RegisterBus]        reg1_input,
    input  wire[`RegisterBus]        reg2_input,

    input  wire[`RegisterAddressBus] write_reg_address_input,
    input  wire                      write_reg_enable_input,

    input  wire[`RegisterBus]        hi_input,
    input  wire[`RegisterBus]        lo_input,

    input  wire[`RegisterBus]        wb_hi_input,
    input  wire[`RegisterBus]        wb_lo_input,
    input  wire                      wb_whilo_input,

    input  wire[`RegisterBus]        mem_hi_input,
    input  wire[`RegisterBus]        mem_lo_input,
    input  wire                      mem_whilo_input,
    
    input  wire[`DoubleRegisterBus]  hilo_temp_input,
    input  wire[1:0]                 count_clock_input,

    input  wire[`DoubleRegisterBus]  div_result_input,
    input  wire                      div_ready_input,

    input  wire                      is_in_delay_slot_input,
	input  wire[`RegisterBus]        link_address_input,

    input  wire                      mem_cp0_reg_write_enable_input,
    input  wire[4:0]                 mem_cp0_reg_write_address_input,
    input  wire[`RegisterBus]        mem_cp0_reg_data_input,

    input  wire                      wb_cp0_reg_write_enable_input,
    input  wire[4:0]                 wb_cp0_reg_write_address_input,
    input  wire[`RegisterBus]        wb_cp0_reg_data_input,

    input  wire[`RegisterBus]        cp0_reg_data_input,

    output reg                       cp0_reg_write_enable_output,
    output reg[4:0]                  cp0_reg_read_address_output,
    output reg[4:0]                  cp0_reg_write_address_output,
    output reg[`RegisterBus]         cp0_reg_data_output,

    output reg[`RegisterAddressBus]  write_reg_address_output,
    output reg                       write_reg_enable_output,
    output reg[`RegisterBus]         write_reg_data_output,

    output reg[`RegisterBus]         hi_output,
    output reg[`RegisterBus]         lo_output,
    output reg                       whilo_output,

    output reg[`DoubleRegisterBus]   hilo_temp_output,
    output reg[1:0]                  count_clock_output,

    output reg                       stop_all_req_from_ex,

    output reg                       div_start_output,
    output reg[`RegisterBus]         div_data1_output,
    output reg[`RegisterBus]         div_data2_output,
    output reg                       is_sign_div_output,

    output wire[`ALUOpBus]           aluop_output,
    output wire[`RegisterBus]        memory_address_output,
    output wire[`RegisterBus]        reg2_output
);

    reg[`RegisterBus]        logic_res;
    reg[`RegisterBus]        shift_res;
    reg[`RegisterBus]        move_res;
    reg[`RegisterBus]        HI;
    reg[`RegisterBus]  	 	 LO;
     
    wire               		 overflow_sum;
    wire               		 reg1_equal_reg2;
    wire               		 reg1_less_than_reg2;
    reg[`RegisterBus]  		 arithmetic_res;
    wire[`RegisterBus] 		 reg2_input_mux;
    wire[`RegisterBus] 		 reg1_input_not;
    wire[`RegisterBus] 		 result_sum;
    wire[`RegisterBus]       mult_data1;
    wire[`RegisterBus]       mult_data2;
    wire[`DoubleRegisterBus] hilo_temp;
    reg[`DoubleRegisterBus]  hilo_temp1;
    reg[`DoubleRegisterBus]  mul_res;

    reg                      stop_all_req_for_madd_msub;
    reg                      stop_all_req_for_div;

    assign aluop_output = aluop_input;
    assign memory_address_output = reg1_input + {{16{instruction_input[15]}}, instruction_input[15:0]};
    assign reg2_output = reg2_input;

    assign reg2_input_mux = ((aluop_input == `EXE_SUB_OP) ||
                            (aluop_input == `EXE_SUBU_OP) ||
                            (aluop_input == `EXE_SLT_OP)) ? (~reg2_input) + 1: reg2_input;

    assign result_sum = reg1_input + reg2_input_mux;

    assign overflow_sum = ((!reg1_input[31] && !reg2_input_mux[31]) && result_sum[31]) ||
                            ((reg1_input[31] && reg2_input_mux[31]) && !result_sum[31]);

    assign reg1_less_than_reg2 = ((aluop_input == `EXE_SLT_OP)) ?
                                        ((reg1_input[31] && !reg2_input[31]) ||
                                        (!reg1_input[31] && !reg2_input[31] && result_sum[31]) ||
                                        (reg1_input[31] && reg2_input[31] && result_sum[31]))
                                    :(reg1_input < reg2_input);

    assign reg1_input_not = ~reg1_input;

    assign mult_data1 = (((aluop_input == `EXE_MUL_OP) || 
                        (aluop_input == `EXE_MULT_OP) ||
                        (aluop_input == `EXE_MADD_OP) ||
                        (aluop_input == `EXE_MSUB_OP)) &&
                        (reg1_input[31] == 1'b1)) ? (~reg1_input + 1) : reg1_input;
    assign mult_data2 = (((aluop_input == `EXE_MUL_OP) || 
                        (aluop_input == `EXE_MULT_OP) ||
                        (aluop_input == `EXE_MADD_OP) ||
                        (aluop_input == `EXE_MSUB_OP)) &&
                        (reg2_input[31] == 1'b1)) ? (~reg2_input + 1) : reg2_input;

    assign hilo_temp = mult_data1 * mult_data2; 
	 
    always @ (*) begin
        if (reset == `ResetEnable) begin
            arithmetic_res <= `ZeroWord;
        end else begin
            case (aluop_input)
                `EXE_SLT_OP, `EXE_SLTU_OP: begin
                    arithmetic_res <= reg1_less_than_reg2;
                end
                `EXE_ADD_OP, `EXE_ADDU_OP, `EXE_ADDI_OP, `EXE_ADDIU_OP: begin
                    arithmetic_res <= result_sum;
                end
                `EXE_SUB_OP, `EXE_SUBU_OP: begin
                    arithmetic_res <= result_sum;
                end
                `EXE_CLZ_OP: begin
                    arithmetic_res <= reg1_input[31] ? 0 : reg1_input[30] ? 1:
                                        reg1_input[29] ? 2: reg1_input[28] ? 3:
                                        reg1_input[27] ? 4: reg1_input[26] ? 5:
                                        reg1_input[25] ? 6: reg1_input[24] ? 7:
                                        reg1_input[23] ? 8: reg1_input[22] ? 9:
                                        reg1_input[21] ? 10: reg1_input[20] ? 11:
                                        reg1_input[19] ? 12: reg1_input[18] ? 13:
                                        reg1_input[17] ? 14: reg1_input[16] ? 15:
                                        reg1_input[15] ? 16: reg1_input[14] ? 17:
                                        reg1_input[13] ? 18: reg1_input[12] ? 19:
                                        reg1_input[11] ? 20: reg1_input[10] ? 21:
                                        reg1_input[9] ? 22: reg1_input[8] ? 23:
                                        reg1_input[7] ? 24: reg1_input[6] ? 25:
                                        reg1_input[5] ? 26: reg1_input[4] ? 27:
                                        reg1_input[3] ? 28: reg1_input[2] ? 29:
                                        reg1_input[1] ? 30: reg1_input[0] ? 31: 32;
                end
                `EXE_CLO_OP: begin
                    arithmetic_res <= reg1_input_not[31] ? 0 : reg1_input_not[30] ? 1:
                                        reg1_input_not[29] ? 2: reg1_input_not[28] ? 3:
                                        reg1_input_not[27] ? 4: reg1_input_not[26] ? 5:
                                        reg1_input_not[25] ? 6: reg1_input_not[24] ? 7:
                                        reg1_input_not[23] ? 8: reg1_input_not[22] ? 9:
                                        reg1_input_not[21] ? 10: reg1_input_not[20] ? 11:
                                        reg1_input_not[19] ? 12: reg1_input_not[18] ? 13:
                                        reg1_input_not[17] ? 14: reg1_input_not[16] ? 15:
                                        reg1_input_not[15] ? 16: reg1_input_not[14] ? 17:
                                        reg1_input_not[13] ? 18: reg1_input_not[12] ? 19:
                                        reg1_input_not[11] ? 20: reg1_input_not[10] ? 21:
                                        reg1_input_not[9] ? 22: reg1_input_not[8] ? 23:
                                        reg1_input_not[7] ? 24: reg1_input_not[6] ? 25:
                                        reg1_input_not[5] ? 26: reg1_input_not[4] ? 27:
                                        reg1_input_not[3] ? 28: reg1_input_not[2] ? 29:
                                        reg1_input_not[1] ? 30: reg1_input_not[0] ? 31: 32;
                end
                default: begin
                    arithmetic_res <= `ZeroWord;
                end
            endcase
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            mul_res <= {`ZeroWord, `ZeroWord};
        end else if ((aluop_input == `EXE_MULT_OP) || 
                    (aluop_input == `EXE_MUL_OP) ||
                    (aluop_input == `EXE_MADD_OP) ||
                    (aluop_input == `EXE_MSUB_OP)) begin
            if (reg1_input[31] ^ reg2_input[31] == 1'b1) begin
                mul_res <= ~hilo_temp + 1;
            end else begin
                mul_res <= hilo_temp;
            end
        end else begin
            mul_res <= hilo_temp;
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            {HI, LO} <= {`ZeroWord, `ZeroWord};
        end else if (mem_whilo_input == `WriteEnable) begin
            {HI, LO} <= {mem_hi_input, mem_lo_input};
        end else if (wb_whilo_input == `WriteEnable) begin
            {HI, LO} <= {wb_hi_input, wb_lo_input};
        end else begin
            {HI, LO} <= {hi_input, lo_input};
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            move_res <= `ZeroWord;
        end else begin
            move_res <= `ZeroWord;
            case (aluop_input)
                `EXE_MFHI_OP: begin
                    move_res <= HI;
                end
                `EXE_MFLO_OP: begin
                    move_res <= LO;
                end
                `EXE_MOVZ_OP: begin
                    move_res <= reg1_input;
                end
                `EXE_MOVN_OP: begin
                    move_res <= reg1_input;
                end
                `EXE_MFC0_OP: begin
                    cp0_reg_read_address_output <= instruction_input[15:11];
                    move_res <= cp0_reg_data_input;
                    if ((mem_cp0_reg_write_enable_input == `WriteEnable) &&
                        (mem_cp0_reg_write_address_input == instruction_input[15:11])) begin
                        move_res <= mem_cp0_reg_data_input;
                    end else if ((wb_cp0_reg_write_enable_input == `WriteEnable) &&
                                (wb_cp0_reg_write_address_input == instruction_input[15:11])) begin
                        move_res <= wb_cp0_reg_data_input;
                    end
                end
                default: begin
                end
            endcase
        end
    end

    always @ (*) begin
        stop_all_req_from_ex = stop_all_req_for_madd_msub || stop_all_req_for_div;
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            hilo_temp_output <= {`ZeroWord, `ZeroWord};
            count_clock_output <= 2'b00;
            stop_all_req_for_madd_msub <= `NoStop;
        end else begin
            case (aluop_input)
                `EXE_MADD_OP, `EXE_MADDU_OP: begin
                    if (count_clock_input == 2'b00) begin
                        hilo_temp_output <= mul_res;
                        count_clock_output <= 2'b01;
                        stop_all_req_for_madd_msub <= `Stop;
                        hilo_temp1 <= {`ZeroWord, `ZeroWord};
                    end else if (count_clock_input == 2'b01) begin
                        hilo_temp_output <= {`ZeroWord, `ZeroWord};
                        count_clock_output <= 2'b10;
                        hilo_temp1 = hilo_temp_input + {HI, LO};
                        stop_all_req_for_madd_msub <= `NoStop;
                    end
                end
                `EXE_MSUB_OP, `EXE_MSUBU_OP: begin
                    if (count_clock_input == 2'b00) begin
                        hilo_temp_output <= ~mul_res + 1;
                        count_clock_output <= 2'b01;
                        stop_all_req_for_madd_msub <= `Stop;
                    end else if (count_clock_input == 2'b01) begin
                        hilo_temp_output <= {`ZeroWord, `ZeroWord};
                        count_clock_output <= 2'b10;
                        hilo_temp1 = hilo_temp_input + {HI, LO};
                        stop_all_req_for_madd_msub <= `NoStop;
                    end
                end
                default: begin
                    hilo_temp_output <= {`ZeroWord, `ZeroWord};
                    count_clock_output <= 2'b00;
                    stop_all_req_for_madd_msub <= `NoStop;
                end
            endcase
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            stop_all_req_for_div <= `NoStop;
            div_data1_output <= `ZeroWord;
            div_data2_output <= `ZeroWord;
            div_start_output <= `DivStop;
            is_sign_div_output <= 1'b0;
        end else begin
            stop_all_req_for_div <= `NoStop;
            div_data1_output <= `ZeroWord;
            div_data2_output <= `ZeroWord;
            div_start_output <= `DivStop;
            is_sign_div_output <= 1'b0;
            case(aluop_input)
                `EXE_DIV_OP: begin
                    if (div_ready_input == `DivResultNotReady) begin
                        div_data1_output <= reg1_input;
                        div_data2_output <= reg2_input;
                        div_start_output <= `DivStart;
                        is_sign_div_output <= 1'b1;
                        stop_all_req_for_div <= `Stop;
                    end else if (div_ready_input == `DivResultReady) begin
                        div_data1_output <= reg1_input;
                        div_data2_output <= reg2_input;
                        div_start_output <= `DivStop;
                        is_sign_div_output <= 1'b1;
                        stop_all_req_for_div <= `NoStop;
                    end else begin
                        div_data1_output <= `ZeroWord;
                        div_data2_output <= `ZeroWord;
                        div_start_output <= `DivStop;
                        is_sign_div_output <= 1'b0;
                        stop_all_req_for_div <= `NoStop;
                    end
                end
                `EXE_DIVU_OP:begin
                    if (div_ready_input == `DivResultNotReady) begin
                        div_data1_output <= reg1_input;
                        div_data2_output <= reg2_input;
                        div_start_output <= `DivStart;
                        is_sign_div_output <= 1'b0;
                        stop_all_req_for_div <= `Stop;
                    end else if (div_ready_input == `DivResultReady) begin
                        div_data1_output <= reg1_input;
                        div_data2_output <= reg2_input;
                        div_start_output <= `DivStop;
                        is_sign_div_output <= 1'b0;
                        stop_all_req_for_div <= `NoStop;
                    end else begin
                        div_data1_output <= `ZeroWord;
                        div_data2_output <= `ZeroWord;
                        div_start_output <= `DivStop;
                        is_sign_div_output <= 1'b0;
                        stop_all_req_for_div <= `NoStop;
                    end
                end
            endcase
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            logic_res <= `ZeroWord;
        end else begin
            case (aluop_input)
                `EXE_OR_OP: begin
                    logic_res <= reg1_input | reg2_input;
                end
                `EXE_AND_OP: begin
                    logic_res <= reg1_input & reg2_input;
                end
                `EXE_NOR_OP: begin
                    logic_res <= ~(reg1_input | reg2_input);
                end
                `EXE_XOR_OP: begin
                    logic_res <= reg1_input ^ reg2_input;
                end
                default: begin
                    logic_res <= `ZeroWord;
                end
            endcase
        end
    end
    
    always @ (*) begin
        if (reset == `ResetEnable) begin
            shift_res <= `ZeroWord;
        end else begin
            case (aluop_input)
                `EXE_SLL_OP: begin
                    shift_res <= (reg2_input << reg1_input[4:0]);
                end
                `EXE_SRL_OP: begin
                    shift_res <= (reg2_input >> reg1_input[4:0]);
                end
                `EXE_SRA_OP: begin
                    //shift_res <= ({32{reg2_input[31]}} < (6'd32 - {1'b0, reg1_input[4:0]})) | reg2_input >> reg1_input[4:0];
                    shift_res <= (reg2_input >>> reg1_input[4:0]);
                end
                default: begin
                    shift_res <= `ZeroWord;
                end
            endcase
        end
    end

    always @ (*) begin
        write_reg_address_output <= write_reg_address_input;

        if(((aluop_input == `EXE_ADD_OP) || (aluop_input == `EXE_ADDI_OP) ||
            (aluop_input == `EXE_SUB_OP)) && (overflow_sum == 1'b1)) begin
            write_reg_enable_output <= `WriteDisable;    
        end else begin
            write_reg_enable_output <= write_reg_enable_input;  
        end
        
        case (alusel_input)
            `EXE_RES_LOGIC: begin
                write_reg_data_output <= logic_res;
            end
            `EXE_RES_SHIFT: begin
                write_reg_data_output <= shift_res;
            end
            `EXE_RES_MOVE: begin
                write_reg_data_output <= move_res;
            end
            `EXE_RES_ARITHMETIC: begin
                write_reg_data_output <= arithmetic_res;
            end
            `EXE_RES_MUL: begin
                write_reg_data_output <= mul_res[31:0];
            end
            `EXE_RES_JUMP_BRANCH: begin
                write_reg_data_output <= link_address_input;
            end
            default: begin
                write_reg_data_output <= `ZeroWord;
            end
        endcase
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            whilo_output <= `WriteDisable;
            hi_output <= `ZeroWord;
            lo_output <= `ZeroWord;
        end else if ((aluop_input == `EXE_MSUB_OP) ||
                    (aluop_input == `EXE_MSUBU_OP)) begin
            whilo_output <= `WriteEnable;
            hi_output <= hilo_temp1[63:32];
            lo_output <= hilo_temp1[31:0];
        end else if ((aluop_input == `EXE_MADD_OP) ||
                    (aluop_input == `EXE_MADDU_OP)) begin
            whilo_output <= `WriteEnable;
            hi_output <= hilo_temp1[63:32];
            lo_output <= hilo_temp1[31:0];
        end else if ((aluop_input == `EXE_MULT_OP) ||
                    (aluop_input == `EXE_MULTU_OP)) begin
            whilo_output <= `WriteEnable;
            hi_output <= mul_res[63:32];
            lo_output <= mul_res[31:0];
        end else if (aluop_input == `EXE_MTHI_OP) begin
            whilo_output <= `WriteEnable;
            hi_output <= reg1_input;
            lo_output <= LO;
        end else if (aluop_input == `EXE_MTLO_OP) begin
            whilo_output <= `WriteEnable;
            hi_output <= HI;
            lo_output <= reg1_input;
        end else if ((aluop_input == `EXE_DIV_OP) ||
                    (aluop_input == `EXE_DIVU_OP)) begin
            whilo_output <= `WriteEnable;
            hi_output <= div_result_input[63:32];
            lo_output <= div_result_input[31:0];
        end else begin
            whilo_output <= `WriteDisable;
            hi_output <= `ZeroWord;
            lo_output <= `ZeroWord;
        end
    end


    always @ (*) begin
        if (reset == `ResetEnable) begin
            cp0_reg_write_address_output <= 5'b00000;
            cp0_reg_write_enable_output <= `WriteDisable;
            cp0_reg_data_output <= `ZeroWord;
        end else if (aluop_input == `EXE_MTC0_OP) begin
            cp0_reg_write_address_output <= instruction_input[15:11];
            cp0_reg_write_enable_output <= `WriteEnable;
            cp0_reg_data_output <= reg1_input;
        end else begin
            cp0_reg_write_address_output <= 5'b00000;
            cp0_reg_write_enable_output <= `WriteDisable;
            cp0_reg_data_output <= `ZeroWord;
        end
    end

endmodule