// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module mips_16_core_top
    (
        input clk,
        input rst,
        output [( 8 - 1 ):0] pc
    );
    wire pipeline_stall_n;
    wire [5:0] branch_offset_imm;
    wire branch_taken;
    wire [15:0] instruction;
    wire [56:0] ID_pipeline_reg_out;
    wire [37:0] EX_pipeline_reg_out;
    wire [36:0] MEM_pipeline_reg_out;
    wire [2:0] reg_read_addr_1;
    wire [2:0] reg_read_addr_2;
    wire [15:0] reg_read_data_1;
    wire [15:0] reg_read_data_2;
    wire [2:0] decoding_op_src1;
    wire [2:0] decoding_op_src2;
    wire [2:0] ex_op_dest;
    wire [2:0] mem_op_dest;
    wire [2:0] wb_op_dest;
    wire reg_write_en;
    wire [2:0] reg_write_dest;
    wire [15:0] reg_write_data;
    wire \IF_stage_inst.clk ;
    wire \IF_stage_inst.rst ;
    wire \IF_stage_inst.instruction_fetch_en ;
    wire [5:0] \IF_stage_inst.branch_offset_imm ;
    wire \IF_stage_inst.branch_taken ;
    reg [( 8 - 1 ):0] \IF_stage_inst.pc ;
    wire [15:0] \IF_stage_inst.instruction ;
    wire \IF_stage_inst.imem.clk ;
    wire [ -( 1):0] \IF_stage_inst.imem.pc ;
    reg [15:0] \IF_stage_inst.imem.instruction ;
    wire [ -( 1):0] \IF_stage_inst.imem.rom_addr  = \IF_stage_inst.imem.pc [ -( 1):0];
    wire \ID_stage_inst.clk ;
    wire \ID_stage_inst.rst ;
    wire \ID_stage_inst.instruction_decode_en ;
    reg [56:0] \ID_stage_inst.pipeline_reg_out ;
    wire [15:0] \ID_stage_inst.instruction ;
    wire [5:0] \ID_stage_inst.branch_offset_imm ;
    reg  \ID_stage_inst.branch_taken ;
    wire [2:0] \ID_stage_inst.reg_read_addr_1 ;
    wire [2:0] \ID_stage_inst.reg_read_addr_2 ;
    wire [15:0] \ID_stage_inst.reg_read_data_1 ;
    wire [15:0] \ID_stage_inst.reg_read_data_2 ;
    wire [2:0] \ID_stage_inst.decoding_op_src1 ;
    wire [2:0] \ID_stage_inst.decoding_op_src2 ;
    reg [15:0] \ID_stage_inst.instruction_reg ;
    wire [3:0] \ID_stage_inst.ir_op_code ;
    wire [2:0] \ID_stage_inst.ir_dest ;
    wire [2:0] \ID_stage_inst.ir_src1 ;
    wire [2:0] \ID_stage_inst.ir_src2 ;
    wire [5:0] \ID_stage_inst.ir_imm ;
    reg  \ID_stage_inst.write_back_en ;
    wire [2:0] \ID_stage_inst.write_back_dest ;
    reg  \ID_stage_inst.write_back_result_mux ;
    wire \ID_stage_inst.mem_write_en ;
    wire [15:0] \ID_stage_inst.mem_write_data ;
    reg [2:0] \ID_stage_inst.ex_alu_cmd ;
    wire [15:0] \ID_stage_inst.ex_alu_src1 ;
    wire [15:0] \ID_stage_inst.ex_alu_src2 ;
    reg  \ID_stage_inst.alu_src2_mux ;
    wire \ID_stage_inst.decoding_op_is_branch ;
    wire \ID_stage_inst.decoding_op_is_store ;
    wire [3:0] \ID_stage_inst.ir_op_code_with_bubble ;
    wire [2:0] \ID_stage_inst.ir_dest_with_bubble ;
    wire \EX_stage_inst.clk ;
    wire \EX_stage_inst.rst ;
    wire [56:0] \EX_stage_inst.pipeline_reg_in ;
    reg [37:0] \EX_stage_inst.pipeline_reg_out ;
    wire [2:0] \EX_stage_inst.ex_op_dest ;
    wire [2:0] \EX_stage_inst.alu_cmd  = \EX_stage_inst.pipeline_reg_in [56:54];
    wire [15:0] \EX_stage_inst.alu_src1  = \EX_stage_inst.pipeline_reg_in [53:38];
    wire [15:0] \EX_stage_inst.alu_src2  = \EX_stage_inst.pipeline_reg_in [37:22];
    wire [15:0] \EX_stage_inst.ex_alu_result ;
    wire \MEM_stage_inst.clk ;
    wire \MEM_stage_inst.rst ;
    wire [37:0] \MEM_stage_inst.pipeline_reg_in ;
    reg [36:0] \MEM_stage_inst.pipeline_reg_out ;
    wire [2:0] \MEM_stage_inst.mem_op_dest ;
    wire [15:0] \MEM_stage_inst.ex_alu_result  = \MEM_stage_inst.pipeline_reg_in [37:22];
    wire \MEM_stage_inst.mem_write_en  = \MEM_stage_inst.pipeline_reg_in [21];
    wire [15:0] \MEM_stage_inst.mem_write_data  = \MEM_stage_inst.pipeline_reg_in [20:5];
    wire [15:0] \MEM_stage_inst.mem_read_data ;
    wire \MEM_stage_inst.dmem.clk ;
    wire [15:0] \MEM_stage_inst.dmem.mem_access_addr ;
    wire [15:0] \MEM_stage_inst.dmem.mem_write_data ;
    wire \MEM_stage_inst.dmem.mem_write_en ;
    wire [15:0] \MEM_stage_inst.dmem.mem_read_data ;
    reg [15:0] \MEM_stage_inst.dmem.ram [( ( 2 ** 8 ) - 1 ):0];
    wire [( 8 - 1 ):0] \MEM_stage_inst.dmem.ram_addr  = \MEM_stage_inst.dmem.mem_access_addr [( 8 - 1 ):0];
    wire [36:0] \WB_stage_inst.pipeline_reg_in ;
    wire \WB_stage_inst.reg_write_en ;
    wire [2:0] \WB_stage_inst.reg_write_dest ;
    wire [15:0] \WB_stage_inst.reg_write_data ;
    wire [2:0] \WB_stage_inst.wb_op_dest ;
    wire [15:0] \WB_stage_inst.ex_alu_result  = \WB_stage_inst.pipeline_reg_in [36:21];
    wire [15:0] \WB_stage_inst.mem_read_data  = \WB_stage_inst.pipeline_reg_in [20:5];
    wire \WB_stage_inst.write_back_en  = \WB_stage_inst.pipeline_reg_in [4];
    wire [2:0] \WB_stage_inst.write_back_dest  = \WB_stage_inst.pipeline_reg_in [3:1];
    wire \WB_stage_inst.write_back_result_mux  = \WB_stage_inst.pipeline_reg_in [0];
    wire \register_file_inst.clk ;
    wire \register_file_inst.rst ;
    wire \register_file_inst.reg_write_en ;
    wire [2:0] \register_file_inst.reg_write_dest ;
    wire [15:0] \register_file_inst.reg_write_data ;
    wire [2:0] \register_file_inst.reg_read_addr_1 ;
    wire [15:0] \register_file_inst.reg_read_data_1 ;
    wire [2:0] \register_file_inst.reg_read_addr_2 ;
    wire [15:0] \register_file_inst.reg_read_data_2 ;
    reg [15:0] \register_file_inst.reg_array [7:0];
    wire [2:0] \hazard_detection_unit_inst.decoding_op_src1 ;
    wire [2:0] \hazard_detection_unit_inst.decoding_op_src2 ;
    wire [2:0] \hazard_detection_unit_inst.ex_op_dest ;
    wire [2:0] \hazard_detection_unit_inst.mem_op_dest ;
    wire [2:0] \hazard_detection_unit_inst.wb_op_dest ;
    reg  \hazard_detection_unit_inst.pipeline_stall_n ;
    assign \IF_stage_inst.clk  = clk;
    assign \IF_stage_inst.rst  = rst;
    assign \IF_stage_inst.instruction_fetch_en  = pipeline_stall_n;
    assign \IF_stage_inst.branch_offset_imm  = branch_offset_imm;
    assign \IF_stage_inst.branch_taken  = branch_taken;
    assign pc = \IF_stage_inst.pc ;
    assign instruction = \IF_stage_inst.instruction ;
    always @ (  posedge \IF_stage_inst.clk  or  posedge \IF_stage_inst.rst )
    begin
        if ( \IF_stage_inst.rst  ) 
        begin
            \IF_stage_inst.pc  <= 8'b0;
        end
        else
        begin
            if ( \IF_stage_inst.instruction_fetch_en  ) 
            begin
                if ( \IF_stage_inst.branch_taken  ) 
                begin
                    \IF_stage_inst.pc  <= ( \IF_stage_inst.pc  + { { ( 8 - 6 ) { \IF_stage_inst.branch_offset_imm [5] } } , \IF_stage_inst.branch_offset_imm [5:0] } );
                end
                else
                begin 
                    \IF_stage_inst.pc  <= ( \IF_stage_inst.pc  + 8'd1 );
                end
            end
        end
    end
    assign \IF_stage_inst.imem.clk  = \IF_stage_inst.clk ;
    assign \IF_stage_inst.imem.pc  = \IF_stage_inst.pc ;
    assign \IF_stage_inst.instruction  = \IF_stage_inst.imem.instruction ;
    always @ (  * )
    begin
        case ( \IF_stage_inst.imem.rom_addr  ) 
        4'b0000:
        begin
            \IF_stage_inst.imem.instruction  = 16'b1001001000001000;
        end
        4'b0001:
        begin
            \IF_stage_inst.imem.instruction  = 16'b1001010001001000;
        end
        4'b0010:
        begin
            \IF_stage_inst.imem.instruction  = 16'b1001011010001000;
        end
        4'b0011:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0001100010011000;
        end
        4'b0100:
        begin
            \IF_stage_inst.imem.instruction  = 16'b1011100001000010;
        end
        4'b0101:
        begin
            \IF_stage_inst.imem.instruction  = 16'b1010101001000010;
        end
        4'b0110:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0010110100101000;
        end
        4'b0111:
        begin
            \IF_stage_inst.imem.instruction  = 16'b1100000110111000;
        end
        4'b1000:
        begin
            \IF_stage_inst.imem.instruction  = 16'b1001111111000001;
        end
        4'b1001:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        4'b1010:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        4'b1011:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        4'b1100:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        4'b1101:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        4'b1110:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        4'b1111:
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        default :
        begin
            \IF_stage_inst.imem.instruction  = 16'b0000000000000000;
        end
        endcase
    end
    assign \ID_stage_inst.clk  = clk;
    assign \ID_stage_inst.rst  = rst;
    assign \ID_stage_inst.instruction_decode_en  = pipeline_stall_n;
    assign ID_pipeline_reg_out = \ID_stage_inst.pipeline_reg_out ;
    assign \ID_stage_inst.instruction  = instruction;
    assign branch_offset_imm = \ID_stage_inst.branch_offset_imm ;
    assign branch_taken = \ID_stage_inst.branch_taken ;
    assign reg_read_addr_1 = \ID_stage_inst.reg_read_addr_1 ;
    assign reg_read_addr_2 = \ID_stage_inst.reg_read_addr_2 ;
    assign \ID_stage_inst.reg_read_data_1  = reg_read_data_1;
    assign \ID_stage_inst.reg_read_data_2  = reg_read_data_2;
    assign decoding_op_src1 = \ID_stage_inst.decoding_op_src1 ;
    assign decoding_op_src2 = \ID_stage_inst.decoding_op_src2 ;
    always @ (  posedge \ID_stage_inst.clk  or  posedge \ID_stage_inst.rst )
    begin
        if ( \ID_stage_inst.rst  ) 
        begin
            \ID_stage_inst.instruction_reg  <= 0;
        end
        else
        begin
            if ( \ID_stage_inst.instruction_decode_en  ) 
            begin
                \ID_stage_inst.instruction_reg  <= \ID_stage_inst.instruction ;
            end
        end
    end
    assign \ID_stage_inst.ir_op_code  = \ID_stage_inst.instruction_reg [15:12];
    assign \ID_stage_inst.ir_dest  = \ID_stage_inst.instruction_reg [11:9];
    assign \ID_stage_inst.ir_src1  = \ID_stage_inst.instruction_reg [8:6];
    assign \ID_stage_inst.ir_src2  = ( ( \ID_stage_inst.decoding_op_is_store  ) ? ( \ID_stage_inst.instruction_reg [11:9] ) : ( \ID_stage_inst.instruction_reg [5:3] ) );
    assign \ID_stage_inst.ir_imm  = \ID_stage_inst.instruction_reg [5:0];
    assign \ID_stage_inst.ir_op_code_with_bubble  = ( ( \ID_stage_inst.instruction_decode_en  ) ? ( \ID_stage_inst.ir_op_code  ) : ( 0 ) );
    assign \ID_stage_inst.ir_dest_with_bubble  = ( ( \ID_stage_inst.instruction_decode_en  ) ? ( \ID_stage_inst.ir_dest  ) : ( 0 ) );
    always @ (  * )
    begin
        if ( \ID_stage_inst.rst  ) 
        begin
            \ID_stage_inst.write_back_en  = 0;
            \ID_stage_inst.write_back_result_mux  = 0;
            \ID_stage_inst.ex_alu_cmd  = 0;
            \ID_stage_inst.alu_src2_mux  = 0;
        end
        else
        begin
            case ( \ID_stage_inst.ir_op_code_with_bubble  ) 
            4'b0000:
            begin
                \ID_stage_inst.write_back_en  = 0;
                \ID_stage_inst.write_back_result_mux  = 1'bx;
                \ID_stage_inst.ex_alu_cmd  = 3'bxxx;
                \ID_stage_inst.alu_src2_mux  = 1'bx;
            end
            4'b0001:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b000;
                \ID_stage_inst.alu_src2_mux  = 0;
            end
            4'b0010:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b001;
                \ID_stage_inst.alu_src2_mux  = 0;
            end
            4'b0011:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b010;
                \ID_stage_inst.alu_src2_mux  = 0;
            end
            4'b0100:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b011;
                \ID_stage_inst.alu_src2_mux  = 0;
            end
            4'b0101:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b100;
                \ID_stage_inst.alu_src2_mux  = 1'bx;
            end
            4'b0110:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b101;
                \ID_stage_inst.alu_src2_mux  = 0;
            end
            4'b0111:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b110;
                \ID_stage_inst.alu_src2_mux  = 0;
            end
            4'b1000:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b111;
                \ID_stage_inst.alu_src2_mux  = 0;
            end
            4'b1001:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 0;
                \ID_stage_inst.ex_alu_cmd  = 3'b000;
                \ID_stage_inst.alu_src2_mux  = 1;
            end
            4'b1010:
            begin
                \ID_stage_inst.write_back_en  = 1;
                \ID_stage_inst.write_back_result_mux  = 1;
                \ID_stage_inst.ex_alu_cmd  = 3'b000;
                \ID_stage_inst.alu_src2_mux  = 1;
            end
            4'b1011:
            begin
                \ID_stage_inst.write_back_en  = 0;
                \ID_stage_inst.write_back_result_mux  = 1'bx;
                \ID_stage_inst.ex_alu_cmd  = 3'b000;
                \ID_stage_inst.alu_src2_mux  = 1;
            end
            4'b1100:
            begin
                \ID_stage_inst.write_back_en  = 0;
                \ID_stage_inst.write_back_result_mux  = 1'bx;
                \ID_stage_inst.ex_alu_cmd  = 3'bxxx;
                \ID_stage_inst.alu_src2_mux  = 1;
            end
            default :
            begin
                \ID_stage_inst.write_back_en  = 0;
                \ID_stage_inst.write_back_result_mux  = 1'bx;
                \ID_stage_inst.ex_alu_cmd  = 3'bxxx;
                \ID_stage_inst.alu_src2_mux  = 1'bx;
        
            end
            endcase
        end
    end
    assign \ID_stage_inst.decoding_op_is_branch  = ( ( ( \ID_stage_inst.ir_op_code  == 4'b1100 ) ) ? ( 1 ) : ( 0 ) );
    assign \ID_stage_inst.decoding_op_is_store  = ( ( ( \ID_stage_inst.ir_op_code  == 4'b1011 ) ) ? ( 1 ) : ( 0 ) );
    assign \ID_stage_inst.mem_write_data  = \ID_stage_inst.reg_read_data_2 ;
    assign \ID_stage_inst.mem_write_en  = \ID_stage_inst.decoding_op_is_store ;
    assign \ID_stage_inst.write_back_dest  = \ID_stage_inst.ir_dest_with_bubble ;
    assign \ID_stage_inst.ex_alu_src1  = \ID_stage_inst.reg_read_data_1 ;
    assign \ID_stage_inst.ex_alu_src2  = ( ( \ID_stage_inst.alu_src2_mux  ) ? ( { { 10 { \ID_stage_inst.ir_imm [5] } } , \ID_stage_inst.ir_imm  } ) : ( \ID_stage_inst.reg_read_data_2  ) );
    always @ (  posedge \ID_stage_inst.clk  or  posedge \ID_stage_inst.rst )
    begin
        if ( \ID_stage_inst.rst  ) 
        begin
            \ID_stage_inst.pipeline_reg_out [56:0] <= 0;
        end
        else
        begin
            \ID_stage_inst.pipeline_reg_out [56:0] <= { \ID_stage_inst.ex_alu_cmd [2:0], \ID_stage_inst.ex_alu_src1 [15:0], \ID_stage_inst.ex_alu_src2 [15:0], \ID_stage_inst.mem_write_en , \ID_stage_inst.mem_write_data [15:0], \ID_stage_inst.write_back_en , \ID_stage_inst.write_back_dest [2:0], \ID_stage_inst.write_back_result_mux  };
        end
    end
    assign \ID_stage_inst.reg_read_addr_1  = \ID_stage_inst.ir_src1 ;
    assign \ID_stage_inst.reg_read_addr_2  = \ID_stage_inst.ir_src2 ;
    always @ (  * )
    begin
        if ( \ID_stage_inst.decoding_op_is_branch  ) 
        begin
            case ( \ID_stage_inst.ir_dest_with_bubble  ) 
            3'b000:
            begin
                if ( \ID_stage_inst.reg_read_data_1  == 0 ) 
                begin
                    \ID_stage_inst.branch_taken  = 1;
                end
                else
                begin 
                    \ID_stage_inst.branch_taken  = 0;
                end
            end
            default :
            begin
                \ID_stage_inst.branch_taken  = 0;
            end
            endcase
        end
        else
        begin
            \ID_stage_inst.branch_taken  = 0;
        end
    end
    assign \ID_stage_inst.branch_offset_imm  = \ID_stage_inst.ir_imm ;
    assign \ID_stage_inst.decoding_op_src1  = \ID_stage_inst.ir_src1 ;
    assign \ID_stage_inst.decoding_op_src2  = ( ( ( ( ( ( \ID_stage_inst.ir_op_code  == 4'b0000 ) || ( \ID_stage_inst.ir_op_code  == 4'b1001 ) ) || ( \ID_stage_inst.ir_op_code  == 4'b1010 ) ) || ( \ID_stage_inst.ir_op_code  == 4'b1100 ) ) ) ? ( 3'b000 ) : ( \ID_stage_inst.ir_src2  ) );
    assign \EX_stage_inst.clk  = clk;
    assign \EX_stage_inst.rst  = rst;
    assign \EX_stage_inst.pipeline_reg_in  = ID_pipeline_reg_out;
    assign EX_pipeline_reg_out = \EX_stage_inst.pipeline_reg_out ;
    assign ex_op_dest = \EX_stage_inst.ex_op_dest ;
    alu \EX_stage_inst.alu_inst  (
            .a(\EX_stage_inst.alu_src1 ),
            .b(\EX_stage_inst.alu_src2 ),
            .cmd(\EX_stage_inst.alu_cmd ),
            .r(\EX_stage_inst.ex_alu_result )
        );
    always @ (  posedge \EX_stage_inst.clk )
    begin
        if ( \EX_stage_inst.rst  ) 
        begin
            \EX_stage_inst.pipeline_reg_out [37:0] <= 0;
        end
        else
        begin
            \EX_stage_inst.pipeline_reg_out [37:22] <= \EX_stage_inst.ex_alu_result ;
            \EX_stage_inst.pipeline_reg_out [21:0] <= \EX_stage_inst.pipeline_reg_in [21:0];
        end
    end
    assign \EX_stage_inst.ex_op_dest  = \EX_stage_inst.pipeline_reg_in [3:1];
    assign \MEM_stage_inst.clk  = clk;
    assign \MEM_stage_inst.rst  = rst;
    assign \MEM_stage_inst.pipeline_reg_in  = EX_pipeline_reg_out;
    assign MEM_pipeline_reg_out = \MEM_stage_inst.pipeline_reg_out ;
    assign mem_op_dest = \MEM_stage_inst.mem_op_dest ;
    assign \MEM_stage_inst.dmem.clk  = \MEM_stage_inst.clk ;
    assign \MEM_stage_inst.dmem.mem_access_addr  = \MEM_stage_inst.ex_alu_result ;
    assign \MEM_stage_inst.dmem.mem_write_data  = \MEM_stage_inst.mem_write_data ;
    assign \MEM_stage_inst.dmem.mem_write_en  = \MEM_stage_inst.mem_write_en ;
    assign \MEM_stage_inst.mem_read_data  = \MEM_stage_inst.dmem.mem_read_data ;
    always @ (  posedge \MEM_stage_inst.dmem.clk )
    begin
        if ( \MEM_stage_inst.dmem.mem_write_en  ) 
        begin
            \MEM_stage_inst.dmem.ram [\MEM_stage_inst.dmem.ram_addr ] <= \MEM_stage_inst.dmem.mem_write_data ;
        end
    end
    assign \MEM_stage_inst.dmem.mem_read_data  = \MEM_stage_inst.dmem.ram [\MEM_stage_inst.dmem.ram_addr ];
    always @ (  posedge \MEM_stage_inst.clk )
    begin
        if ( \MEM_stage_inst.rst  ) 
        begin
            \MEM_stage_inst.pipeline_reg_out [36:0] <= 0;
        end
        else
        begin
            \MEM_stage_inst.pipeline_reg_out [36:21] <= \MEM_stage_inst.ex_alu_result ;
            \MEM_stage_inst.pipeline_reg_out [20:5] <= \MEM_stage_inst.mem_read_data ;
            \MEM_stage_inst.pipeline_reg_out [4:0] <= \MEM_stage_inst.pipeline_reg_in [4:0];
        end
    end
    assign \MEM_stage_inst.mem_op_dest  = \MEM_stage_inst.pipeline_reg_in [3:1];
    assign \WB_stage_inst.pipeline_reg_in  = MEM_pipeline_reg_out;
    assign reg_write_en = \WB_stage_inst.reg_write_en ;
    assign reg_write_dest = \WB_stage_inst.reg_write_dest ;
    assign reg_write_data = \WB_stage_inst.reg_write_data ;
    assign wb_op_dest = \WB_stage_inst.wb_op_dest ;
    assign \WB_stage_inst.reg_write_en  = \WB_stage_inst.write_back_en ;
    assign \WB_stage_inst.reg_write_dest  = \WB_stage_inst.write_back_dest ;
    assign \WB_stage_inst.reg_write_data  = ( ( \WB_stage_inst.write_back_result_mux  ) ? ( \WB_stage_inst.mem_read_data  ) : ( \WB_stage_inst.ex_alu_result  ) );
    assign \WB_stage_inst.wb_op_dest  = \WB_stage_inst.pipeline_reg_in [3:1];
    assign \register_file_inst.clk  = clk;
    assign \register_file_inst.rst  = rst;
    assign \register_file_inst.reg_write_en  = reg_write_en;
    assign \register_file_inst.reg_write_dest  = reg_write_dest;
    assign \register_file_inst.reg_write_data  = reg_write_data;
    assign \register_file_inst.reg_read_addr_1  = reg_read_addr_1;
    assign reg_read_data_1 = \register_file_inst.reg_read_data_1 ;
    assign \register_file_inst.reg_read_addr_2  = reg_read_addr_2;
    assign reg_read_data_2 = \register_file_inst.reg_read_data_2 ;
    always @ (  posedge \register_file_inst.clk  or  posedge \register_file_inst.rst )
    begin
        if ( \register_file_inst.rst  ) 
        begin
            \register_file_inst.reg_array [0] <= 15'b0;
            \register_file_inst.reg_array [1] <= 15'b0;
            \register_file_inst.reg_array [2] <= 15'b0;
            \register_file_inst.reg_array [3] <= 15'b0;
            \register_file_inst.reg_array [4] <= 15'b0;
            \register_file_inst.reg_array [5] <= 15'b0;
            \register_file_inst.reg_array [6] <= 15'b0;
            \register_file_inst.reg_array [7] <= 15'b0;
        end
        else
        begin
            if ( \register_file_inst.reg_write_en  ) 
            begin
                \register_file_inst.reg_array [\register_file_inst.reg_write_dest ] <= \register_file_inst.reg_write_data ;
            end
        end
    end
    assign \register_file_inst.reg_read_data_1  = ( ( ( \register_file_inst.reg_read_addr_1  == 0 ) ) ? ( 15'b0 ) : ( \register_file_inst.reg_array [\register_file_inst.reg_read_addr_1 ] ) );
    assign \register_file_inst.reg_read_data_2  = ( ( ( \register_file_inst.reg_read_addr_2  == 0 ) ) ? ( 15'b0 ) : ( \register_file_inst.reg_array [\register_file_inst.reg_read_addr_2 ] ) );
    assign \hazard_detection_unit_inst.decoding_op_src1  = decoding_op_src1;
    assign \hazard_detection_unit_inst.decoding_op_src2  = decoding_op_src2;
    assign \hazard_detection_unit_inst.ex_op_dest  = ex_op_dest;
    assign \hazard_detection_unit_inst.mem_op_dest  = mem_op_dest;
    assign \hazard_detection_unit_inst.wb_op_dest  = wb_op_dest;
    assign pipeline_stall_n = \hazard_detection_unit_inst.pipeline_stall_n ;
    always @ (  * )
    begin
        \hazard_detection_unit_inst.pipeline_stall_n  = 1;
        if ( ( \hazard_detection_unit_inst.decoding_op_src1  != 0 ) && ( ( ( \hazard_detection_unit_inst.decoding_op_src1  == \hazard_detection_unit_inst.ex_op_dest  ) || ( \hazard_detection_unit_inst.decoding_op_src1  == \hazard_detection_unit_inst.mem_op_dest  ) ) || ( \hazard_detection_unit_inst.decoding_op_src1  == \hazard_detection_unit_inst.wb_op_dest  ) ) ) 
        begin
            \hazard_detection_unit_inst.pipeline_stall_n  = 0;
        end
        if ( ( \hazard_detection_unit_inst.decoding_op_src2  != 0 ) && ( ( ( \hazard_detection_unit_inst.decoding_op_src2  == \hazard_detection_unit_inst.ex_op_dest  ) || ( \hazard_detection_unit_inst.decoding_op_src2  == \hazard_detection_unit_inst.mem_op_dest  ) ) || ( \hazard_detection_unit_inst.decoding_op_src2  == \hazard_detection_unit_inst.wb_op_dest  ) ) ) 
        begin
            \hazard_detection_unit_inst.pipeline_stall_n  = 0;
        end
    end
endmodule 


