// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module mips_16_core_top (
        input clk,
        input rst,
        output [8-1:0] pc) ;
    wire pipeline_stall_n ;
    wire [5:0] branch_offset_imm ;
    wire branch_taken ;
    wire [15:0] instruction ;
    wire [56:0] ID_pipeline_reg_out ;
    wire [37:0] EX_pipeline_reg_out ;
    wire [36:0] MEM_pipeline_reg_out ;
    wire [2:0] reg_read_addr_1 ;
    wire [2:0] reg_read_addr_2 ;
    wire [15:0] reg_read_data_1 ;
    wire [15:0] reg_read_data_2 ;
    wire [2:0] decoding_op_src1 ;
    wire [2:0] decoding_op_src2 ;
    wire [2:0] ex_op_dest ;
    wire [2:0] mem_op_dest ;
    wire [2:0] wb_op_dest ;
    wire reg_write_en ;
    wire [2:0] reg_write_dest ;
    wire [15:0] reg_write_data ;

    wire  IF_stage_inst_clk;
    wire  IF_stage_inst_rst;
    wire  IF_stage_inst_instruction_fetch_en;
    wire [5:0] IF_stage_inst_branch_offset_imm;
    wire  IF_stage_inst_branch_taken;
    reg [8-1:0] IF_stage_inst_pc;
    wire [15:0] IF_stage_inst_instruction;

    always @(  posedge   clk
                   or  posedge  rst )
    begin
        if ( rst )
        begin
            pc  <=8'b0;
        end
        else
        begin
            if ( instruction_fetch_en )
            begin
                if ( branch_taken )
                    pc  <= pc +{{(8-6){ branch_offset_imm [5]}}, branch_offset_imm [5:0]};
                else
                    pc  <= pc +8'd1;
            end
        end
    end


    wire  imem_clk;
    wire [8-1:0] imem_pc;
    wire [15:0] imem_instruction;

    reg[15:0] rom [2**8-1:0];
    wire[8-1:0] rom_addr = pc [8-1:0];
    assign  instruction = rom [ rom_addr ];
    assign imem_clk = clk;
    assign imem_pc = pc;
    assign instruction = imem_instruction;

    assign IF_stage_inst_clk = clk;
    assign IF_stage_inst_rst = rst;
    assign IF_stage_inst_instruction_fetch_en = pipeline_stall_n;
    assign IF_stage_inst_branch_offset_imm = branch_offset_imm;
    assign IF_stage_inst_branch_taken = branch_taken;
    assign pc = IF_stage_inst_pc;
    assign instruction = IF_stage_inst_instruction;


    wire  ID_stage_inst_clk;
    wire  ID_stage_inst_rst;
    wire  ID_stage_inst_instruction_decode_en;
    reg [56:0] ID_stage_inst_pipeline_reg_out;
    wire [15:0] ID_stage_inst_instruction;
    wire [5:0] ID_stage_inst_branch_offset_imm;
    reg  ID_stage_inst_branch_taken;
    wire [2:0] ID_stage_inst_reg_read_addr_1;
    wire [2:0] ID_stage_inst_reg_read_addr_2;
    wire [15:0] ID_stage_inst_reg_read_data_1;
    wire [15:0] ID_stage_inst_reg_read_data_2;
    wire [2:0] ID_stage_inst_decoding_op_src1;
    wire [2:0] ID_stage_inst_decoding_op_src2;

    reg[15:0] instruction_reg ;
    wire[3:0] ir_op_code ;
    wire[2:0] ir_dest ;
    wire[2:0] ir_src1 ;
    wire[2:0] ir_src2 ;
    wire[5:0] ir_imm ;
    reg write_back_en ;
    wire[2:0] write_back_dest ;
    reg write_back_result_mux ;
    wire mem_write_en ;
    wire[15:0] mem_write_data ;
    reg[2:0] ex_alu_cmd ;
    wire[15:0] ex_alu_src1 ;
    wire[15:0] ex_alu_src2 ;
    reg alu_src2_mux ;
    wire decoding_op_is_branch ;
    wire decoding_op_is_store ;
    wire[3:0] ir_op_code_with_bubble ;
    wire[2:0] ir_dest_with_bubble ;
    always @(  posedge   clk
                   or  posedge  rst )
    begin
        if ( rst )
        begin
            instruction_reg  <=0;
        end
        else
        begin
            if ( instruction_decode_en )
            begin
                instruction_reg  <= instruction ;
            end
        end
    end

    assign  ir_op_code = instruction_reg [15:12];
    assign  ir_dest = instruction_reg [11:9];
    assign  ir_src1 = instruction_reg [8:6];
    assign  ir_src2 =( decoding_op_is_store )? instruction_reg [11:9]: instruction_reg [5:3];
    assign  ir_imm = instruction_reg [5:0];
    assign  ir_op_code_with_bubble =( instruction_decode_en )? ir_op_code :0;
    assign  ir_dest_with_bubble =( instruction_decode_en )? ir_dest :0;
    always @(*)
    begin
        if ( rst )
        begin
            write_back_en  =0;
            write_back_result_mux  =0;
            ex_alu_cmd  =0;
            alu_src2_mux  =0;
        end
        else
        begin
            case ( ir_op_code_with_bubble )
                4 'b0000:
                begin
                    write_back_en  =0;
                    write_back_result_mux  =1'bx;
                    ex_alu_cmd  =3'bxxx;
                    alu_src2_mux  =1'bx;
                end
                4 'b0001:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b000;
                    alu_src2_mux  =0;
                end
                4 'b0010:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b001;
                    alu_src2_mux  =0;
                end
                4 'b0011:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b010;
                    alu_src2_mux  =0;
                end
                4 'b0100:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b011;
                    alu_src2_mux  =0;
                end
                4 'b0101:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b100;
                    alu_src2_mux  =1'bx;
                end
                4 'b0110:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b101;
                    alu_src2_mux  =0;
                end
                4 'b0111:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b110;
                    alu_src2_mux  =0;
                end
                4 'b1000:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b111;
                    alu_src2_mux  =0;
                end
                4 'b1001:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =0;
                    ex_alu_cmd  =3'b000;
                    alu_src2_mux  =1;
                end
                4 'b1010:
                begin
                    write_back_en  =1;
                    write_back_result_mux  =1;
                    ex_alu_cmd  =3'b000;
                    alu_src2_mux  =1;
                end
                4 'b1011:
                begin
                    write_back_en  =0;
                    write_back_result_mux  =1'bx;
                    ex_alu_cmd  =3'b000;
                    alu_src2_mux  =1;
                end
                4 'b1100:
                begin
                    write_back_en  =0;
                    write_back_result_mux  =1'bx;
                    ex_alu_cmd  =3'bxxx;
                    alu_src2_mux  =1;
                end
                default :
                begin
                    write_back_en  =0;
                    write_back_result_mux  =1'bx;
                    ex_alu_cmd  =3'bxxx;
                    alu_src2_mux  =1'bx;
                    $display("ERROR: Unknown Instruction: %b", ir_op_code_with_bubble );
                end
            endcase
        end
    end

    assign  decoding_op_is_branch =( ir_op_code ==4'b1100)?1:0;
    assign  decoding_op_is_store =( ir_op_code ==4'b1011)?1:0;
    assign  mem_write_data = reg_read_data_2 ;
    assign  mem_write_en = decoding_op_is_store ;
    assign  write_back_dest = ir_dest_with_bubble ;
    assign  ex_alu_src1 = reg_read_data_1 ;
    assign  ex_alu_src2 =( alu_src2_mux )?{{10{ ir_imm [5]}}, ir_imm }: reg_read_data_2 ;
    always @(  posedge   clk
                   or  posedge  rst )
    begin
        if ( rst )
        begin
            pipeline_reg_out  [56:0]<=0;
        end
        else
        begin
            pipeline_reg_out  [56:0]<={ ex_alu_cmd [2:0], ex_alu_src1 [15:0], ex_alu_src2 [15:0], mem_write_en , mem_write_data [15:0], write_back_en , write_back_dest [2:0], write_back_result_mux };
        end
    end

    assign  reg_read_addr_1 = ir_src1 ;
    assign  reg_read_addr_2 = ir_src2 ;
    always @(*)
    begin
        if ( decoding_op_is_branch )
        begin
            case ( ir_dest_with_bubble )
                3 'b000:
                begin
                    if ( reg_read_data_1 ==0)
                        branch_taken  =1;
                    else
                        branch_taken  =0;
                end
                default :
                begin
                    branch_taken  =0;
                    $display("ERROR: Unknown branch condition %b, in branch instruction %b \n", ir_dest_with_bubble , ir_op_code_with_bubble );
                end
            endcase
        end
        else
        begin
            branch_taken  =0;
        end
    end

    assign  branch_offset_imm = ir_imm ;
    assign  decoding_op_src1 = ir_src1 ;
    assign  decoding_op_src2 =( ir_op_code ==4'b0000|| ir_op_code ==4'b1001|| ir_op_code ==4'b1010|| ir_op_code ==4'b1100)?3'b000: ir_src2 ;
    assign ID_stage_inst_clk = clk;
    assign ID_stage_inst_rst = rst;
    assign ID_stage_inst_instruction_decode_en = pipeline_stall_n;
    assign ID_pipeline_reg_out = ID_stage_inst_pipeline_reg_out;
    assign ID_stage_inst_instruction = instruction;
    assign branch_offset_imm = ID_stage_inst_branch_offset_imm;
    assign branch_taken = ID_stage_inst_branch_taken;
    assign reg_read_addr_1 = ID_stage_inst_reg_read_addr_1;
    assign reg_read_addr_2 = ID_stage_inst_reg_read_addr_2;
    assign ID_stage_inst_reg_read_data_1 = reg_read_data_1;
    assign ID_stage_inst_reg_read_data_2 = reg_read_data_2;
    assign decoding_op_src1 = ID_stage_inst_decoding_op_src1;
    assign decoding_op_src2 = ID_stage_inst_decoding_op_src2;


    wire  EX_stage_inst_clk;
    wire  EX_stage_inst_rst;
    wire [56:0] EX_stage_inst_pipeline_reg_in;
    reg [37:0] EX_stage_inst_pipeline_reg_out;
    wire [2:0] EX_stage_inst_ex_op_dest;

    wire[2:0] alu_cmd = pipeline_reg_in [56:54];
    wire[15:0] alu_src1 = pipeline_reg_in [53:38];
    wire[15:0] alu_src2 = pipeline_reg_in [37:22];
    wire[15:0] ex_alu_result ;

    wire [15:0] alu_inst_a;
    wire [15:0] alu_inst_b;
    wire [2:0] alu_inst_cmd;
    reg [15:0] alu_inst_r;

    always @(*)
    begin
        case ( cmd )
            3 'bxxx:
                r  =16'bx;
            3 'b000:
                r  = a + b ;
            3 'b001:
                r  = a - b ;
            3 'b010:
                r  = a & b ;
            3 'b011:
                r  = a | b ;
            3 'b100:
                r  = a ^ b ;
            3 'b101:
                r  = a << b ;
            3 'b110:
                r  ={{16{ a [15]}}, a }>> b ;
            3 'b111:
                r  ={16'b0, a }>> b ;
            default :
            begin
                r  =0;
                $display("ERROR: Unknown alu cmd: %b \n", cmd );
            end
        endcase
    end

    assign alu_inst_a = alu_src1;
    assign alu_inst_b = alu_src2;
    assign alu_inst_cmd = alu_cmd;
    assign ex_alu_result = alu_inst_r;

    always @( posedge  clk )
    begin
        if ( rst )
        begin
            pipeline_reg_out  [37:0]<=0;
        end
        else
        begin
            pipeline_reg_out  [37:22]<= ex_alu_result ;
            pipeline_reg_out  [21:0]<= pipeline_reg_in [21:0];
        end
    end

    assign  ex_op_dest = pipeline_reg_in [3:1];
    assign EX_stage_inst_clk = clk;
    assign EX_stage_inst_rst = rst;
    assign EX_stage_inst_pipeline_reg_in = ID_pipeline_reg_out;
    assign EX_pipeline_reg_out = EX_stage_inst_pipeline_reg_out;
    assign ex_op_dest = EX_stage_inst_ex_op_dest;


    wire  MEM_stage_inst_clk;
    wire  MEM_stage_inst_rst;
    wire [37:0] MEM_stage_inst_pipeline_reg_in;
    reg [36:0] MEM_stage_inst_pipeline_reg_out;
    wire [2:0] MEM_stage_inst_mem_op_dest;

    wire[15:0] ex_alu_result = pipeline_reg_in [37:22];
    wire mem_write_en = pipeline_reg_in [21];
    wire[15:0] mem_write_data = pipeline_reg_in [20:5];
    wire[15:0] mem_read_data ;

    wire  dmem_clk;
    wire [15:0] dmem_mem_access_addr;
    wire [15:0] dmem_mem_write_data;
    wire  dmem_mem_write_en;
    wire [15:0] dmem_mem_read_data;

    reg[15:0] ram [(2**8)-1:0];
    wire[8-1:0] ram_addr = mem_access_addr [8-1:0];
    always @( posedge  clk )
        if ( mem_write_en )
            ram  [ ram_addr ]<= mem_write_data ;

    assign  mem_read_data = ram [ ram_addr ];
    assign dmem_clk = clk;
    assign dmem_mem_access_addr = ex_alu_result;
    assign dmem_mem_write_data = mem_write_data;
    assign dmem_mem_write_en = mem_write_en;
    assign mem_read_data = dmem_mem_read_data;

    always @( posedge  clk )
    begin
        if ( rst )
        begin
            pipeline_reg_out  [36:0]<=0;
        end
        else
        begin
            pipeline_reg_out  [36:21]<= ex_alu_result ;
            pipeline_reg_out  [20:5]<= mem_read_data ;
            pipeline_reg_out  [4:0]<= pipeline_reg_in [4:0];
        end
    end

    assign  mem_op_dest = pipeline_reg_in [3:1];
    assign MEM_stage_inst_clk = clk;
    assign MEM_stage_inst_rst = rst;
    assign MEM_stage_inst_pipeline_reg_in = EX_pipeline_reg_out;
    assign MEM_pipeline_reg_out = MEM_stage_inst_pipeline_reg_out;
    assign mem_op_dest = MEM_stage_inst_mem_op_dest;


    wire [36:0] WB_stage_inst_pipeline_reg_in;
    wire  WB_stage_inst_reg_write_en;
    wire [2:0] WB_stage_inst_reg_write_dest;
    wire [15:0] WB_stage_inst_reg_write_data;
    wire [2:0] WB_stage_inst_wb_op_dest;

    wire[15:0] ex_alu_result = pipeline_reg_in [36:21];
    wire[15:0] mem_read_data = pipeline_reg_in [20:5];
    wire write_back_en = pipeline_reg_in [4];
    wire[2:0] write_back_dest = pipeline_reg_in [3:1];
    wire write_back_result_mux = pipeline_reg_in [0];
    assign  reg_write_en = write_back_en ;
    assign  reg_write_dest = write_back_dest ;
    assign  reg_write_data =( write_back_result_mux )? mem_read_data : ex_alu_result ;
    assign  wb_op_dest = pipeline_reg_in [3:1];
    assign WB_stage_inst_pipeline_reg_in = MEM_pipeline_reg_out;
    assign reg_write_en = WB_stage_inst_reg_write_en;
    assign reg_write_dest = WB_stage_inst_reg_write_dest;
    assign reg_write_data = WB_stage_inst_reg_write_data;
    assign wb_op_dest = WB_stage_inst_wb_op_dest;


    wire  register_file_inst_clk;
    wire  register_file_inst_rst;
    wire  register_file_inst_reg_write_en;
    wire [2:0] register_file_inst_reg_write_dest;
    wire [15:0] register_file_inst_reg_write_data;
    wire [2:0] register_file_inst_reg_read_addr_1;
    wire [15:0] register_file_inst_reg_read_data_1;
    wire [2:0] register_file_inst_reg_read_addr_2;
    wire [15:0] register_file_inst_reg_read_data_2;

    reg[15:0] reg_array [7:0];
    always @(  posedge   clk
                   or  posedge  rst )
    begin
        if ( rst )
        begin
            reg_array  [0]<=15'b0;
            reg_array  [1]<=15'b0;
            reg_array  [2]<=15'b0;
            reg_array  [3]<=15'b0;
            reg_array  [4]<=15'b0;
            reg_array  [5]<=15'b0;
            reg_array  [6]<=15'b0;
            reg_array  [7]<=15'b0;
        end
        else
        begin
            if ( reg_write_en )
            begin
                reg_array  [ reg_write_dest ]<= reg_write_data ;
            end
        end
    end

    assign  reg_read_data_1 =( reg_read_addr_1 ==0)?15'b0: reg_array [ reg_read_addr_1 ];
    assign  reg_read_data_2 =( reg_read_addr_2 ==0)?15'b0: reg_array [ reg_read_addr_2 ];
    assign register_file_inst_clk = clk;
    assign register_file_inst_rst = rst;
    assign register_file_inst_reg_write_en = reg_write_en;
    assign register_file_inst_reg_write_dest = reg_write_dest;
    assign register_file_inst_reg_write_data = reg_write_data;
    assign register_file_inst_reg_read_addr_1 = reg_read_addr_1;
    assign reg_read_data_1 = register_file_inst_reg_read_data_1;
    assign register_file_inst_reg_read_addr_2 = reg_read_addr_2;
    assign reg_read_data_2 = register_file_inst_reg_read_data_2;


    wire [2:0] hazard_detection_unit_inst_decoding_op_src1;
    wire [2:0] hazard_detection_unit_inst_decoding_op_src2;
    wire [2:0] hazard_detection_unit_inst_ex_op_dest;
    wire [2:0] hazard_detection_unit_inst_mem_op_dest;
    wire [2:0] hazard_detection_unit_inst_wb_op_dest;
    reg  hazard_detection_unit_inst_pipeline_stall_n;

    always @(*)
    begin
        pipeline_stall_n  =1;
        if ( decoding_op_src1 !=0&&( decoding_op_src1 == ex_op_dest || decoding_op_src1 == mem_op_dest || decoding_op_src1 == wb_op_dest ))
            pipeline_stall_n  =0;
        if ( decoding_op_src2 !=0&&( decoding_op_src2 == ex_op_dest || decoding_op_src2 == mem_op_dest || decoding_op_src2 == wb_op_dest ))
            pipeline_stall_n  =0;
    end

    assign hazard_detection_unit_inst_decoding_op_src1 = decoding_op_src1;
    assign hazard_detection_unit_inst_decoding_op_src2 = decoding_op_src2;
    assign hazard_detection_unit_inst_ex_op_dest = ex_op_dest;
    assign hazard_detection_unit_inst_mem_op_dest = mem_op_dest;
    assign hazard_detection_unit_inst_wb_op_dest = wb_op_dest;
    assign pipeline_stall_n = hazard_detection_unit_inst_pipeline_stall_n;

endmodule
