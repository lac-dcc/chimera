`include "defines.v"

module openmips(
    input  wire               clock,
    input  wire               reset,

    // input  wire[`RegisterBus] rom_data_input,
    // output wire[`RegisterBus] rom_address_output,
    // output wire               rom_chip_enable,

    input  wire[`RegisterBus] iwishbone_data_input,
    input  wire               iwishbone_ack_input,
    output reg[`RegisterBus]  iwishbone_address_output,
    output reg[`RegisterBus]  iwishbone_data_output,
    output reg                iwishbone_write_enable_output,
    output reg[3:0]           iwishbone_sel_output,
    output reg                iwishbone_stb_output,
    output reg                iwishbone_cyc_output,

    input  wire[`RegisterBus] dwishbone_data_input,
    input  wire               dwishbone_ack_input,
    output reg[`RegisterBus]  dwishbone_address_output,
    output reg[`RegisterBus]  dwishbone_data_output,
    output reg                dwishbone_write_enable_output,
    output reg[3:0]           dwishbone_sel_output,
    output reg                dwishbone_stb_output,
    output reg                dwishbone_cyc_output,

    input  wire[5:0]          interrupt_input,
    output wire               timer_interrupt_output
);
    wire                         rom_chip_enable;
    wire[`RegisterBus] ram_data_input;
    wire[`RegisterBus] ram_address_output;
    wire[`RegisterBus] ram_data_output;
    wire               ram_write_enable_output;
    wire[3:0]          ram_sel_output;
    wire               ram_chip_enable;
    
    // Fetch
    wire[`InstructionAddressBus] program_counter;
    wire[`InstructionBus]        instruction_input;
    wire[`InstructionAddressBus] id_program_counter_input;
    wire[`InstructionBus]        id_instruction_input;
    // Decode
    wire[`ALUOpBus]              id_aluop_output;
    wire[`ALUSelBus]             id_alusel_output;
    wire[`RegisterBus]           id_reg1_output;
    wire[`RegisterBus]           id_reg2_output;
    wire                         id_write_reg_enable_output;
    wire[`RegisterAddressBus]    id_write_reg_address_output;
    // Execute   
    wire[`ALUOpBus]              ex_aluop_input;
    wire[`ALUSelBus]             ex_alusel_input;
     
    wire[`RegisterBus]           ex_reg1_input;
    wire[`RegisterBus]           ex_reg2_input;
     
    wire                         ex_write_reg_enable_intput;
    wire[`RegisterAddressBus]    ex_write_reg_address_intput;
         
    wire                         ex_write_reg_enable_output;
    wire[`RegisterAddressBus]    ex_write_reg_address_output;
    wire[`RegisterBus]           ex_write_reg_data_output;
         
    wire                         ex_whilo_output;
    wire[`RegisterBus]           ex_hi_output;
    wire[`RegisterBus]           ex_lo_output;

    // Memory
    wire                         mem_whilo_input;
    wire[`RegisterBus]           mem_hi_input;
    wire[`RegisterBus]           mem_lo_input;
     
    wire                         mem_write_reg_enable_input;
    wire[`RegisterAddressBus]    mem_write_reg_address_input;
    wire[`RegisterBus]           mem_write_reg_data_input;
         
    wire                         mem_write_reg_enable_output;
    wire[`RegisterAddressBus]    mem_write_reg_address_output;
    wire[`RegisterBus]           mem_write_reg_data_output;
     
    wire                         mem_whilo_output;
    wire[`RegisterBus]           mem_hi_output;
    wire[`RegisterBus]           mem_lo_output;
     
    // WriteBack     
    wire                         wb_write_reg_enable_intput;
    wire[`RegisterAddressBus]    wb_write_reg_address_intput;
    wire[`RegisterBus]           wb_write_reg_data_intput;
     
    wire[`RegisterBus]           wb_hi_output;
    wire[`RegisterBus]           wb_lo_output;
    wire                         wb_whilo_output;
         
    wire[`RegisterBus]           hi_output;
    wire[`RegisterBus]           lo_output;
     
    wire                         reg1_read;
    wire                         reg2_read;
    wire[`RegisterBus]           reg1_data;
    wire[`RegisterBus]           reg2_data;
    wire[`RegisterAddressBus]    reg1_address;
    wire[`RegisterAddressBus]    reg2_address;
    // Ctrl  
    wire                         stop_all_req_from_if;
    wire                         stop_all_req_from_id;
    wire                         stop_all_req_from_ex;
    wire                         stop_all_req_from_mem;
    wire[`StopAllBus]            stop_all;
     
    // MADD, MSUB    
    wire[`DoubleRegisterBus]     ex_hilo_temp_output;
    wire[1:0]                    ex_count_clock_output;
    wire[`DoubleRegisterBus]     ex_mem_hilo_temp_output;
    wire[1:0]                    ex_mem_count_clock_output;
     
    // Div   
    wire[`DoubleRegisterBus]     ex_div_result_output;
    wire                         ex_div_ready_output;
     
    wire                         ex_div_start_output;
    wire[`RegisterBus]           ex_div_data1_output;
    wire[`RegisterBus]           ex_div_data2_output;
    wire                         ex_div_is_sign_div_output;
     
    wire[`DoubleRegisterBus]     div_ex_result_output;
    wire                         div_ex_ready_output;
     
    // Branch    
    wire 					     branch_flag_output;
    wire[`RegisterBus]           branch_address_output;
    wire                         id_is_in_delay_slot_output;
    wire[`RegisterBus]           id_link_address_output;
    wire                         id_next_instrcution_in_delay_slot_output;
    wire                         ex_is_in_delay_slot_input;
    wire[`RegisterBus]           ex_link_address_output;
    wire                         id_ex_is_in_delay_slot_output;
         
    wire[`RegisterBus]           id_instruction_output;
    wire[`RegisterBus]           ex_instruction_output;
     
    wire[`ALUOpBus]              ex_aluop_output;
    wire[`RegisterBus]           ex_memory_address_output;
    wire[`RegisterBus]           ex_reg2_output;
     
    wire[`ALUOpBus]              mem_aluop_output;
    wire[`RegisterBus]           mem_memory_address_output;
    wire[`RegisterBus]           mem_reg2_output;
    
    wire[`RegisterBus]           cp0_data_output;
    wire[4:0]                    ex_cp0_reg_read_address_output;

    wire                         ex_cp0_write_enable_output;
    wire[4:0]                    ex_cp0_reg_write_address_output;
    wire[`RegisterBus]           ex_cp0_reg_data_output;
             
    wire                         ex_mem_cp0_reg_write_enable_output;
    wire[4:0]                    ex_mem_cp0_reg_write_address_output;
    wire[`RegisterBus]           ex_mem_cp0_reg_data_output;
             
    wire                         mem_cp0_reg_write_enable_output;
    wire[4:0]                    mem_cp0_reg_write_address_output;
    wire[`RegisterBus]           mem_cp0_reg_data_output;
             
    wire                         mem_wb_cp0_reg_write_enable_output;
    wire[4:0]                    mem_wb_cp0_reg_write_address_output;
    wire[`RegisterBus]           mem_wb_cp0_reg_data_output;

    wire                         flush_output;
    wire[`InstructionAddressBus] new_program_counter_output;
                 
    wire[31:0]                   id_exception_type_output;
    wire[`RegisterBus]           id_current_instruction_address_output;
             
    wire[31:0]                   ex_exception_type_input;
    wire[`RegisterBus]           ex_current_instruction_address_input;
             
    wire[31:0]                   ex_exception_type_output;
    wire[`RegisterBus]           ex_current_instruction_address_output;
    wire                         ex_is_in_delay_slot_output;
             
    wire[31:0]                   mem_exception_type_input;
    wire[`RegisterBus]           mem_current_instruction_address_input;
    wire                         mem_is_in_delay_slot_input;
             
    wire[31:0]                   mem_exception_type_output;
    wire[`RegisterBus]           mem_current_instruction_address_output;
    wire                         mem_is_in_delay_slot_output;
    wire[`RegisterBus]           mem_cp0_epc_output;
             
    wire[`RegisterBus]           cp0_status_output;
    wire[`RegisterBus]           cp0_cause_output;
    wire[`RegisterBus]           cp0_epc_output;
    wire[`RegisterBus]           cp0_count_output;
    wire[`RegisterBus]           cp0_compare_output;
    wire[`RegisterBus]           cp0_config_output;
    wire[`RegisterBus]           cp0_prid_output;

    ctrl ctrl0(
        .reset(reset),
        .stop_all_req_from_id(stop_all_req_from_id),
        .stop_all_req_from_ex(stop_all_req_from_ex),

        .exception_type_input(mem_exception_type_output),
        .cp0_epc_input(mem_cp0_epc_output),
        .new_program_counter(new_program_counter_output),
        .flush(flush_output),

        .stop_all(stop_all)
    );

    pc_reg pc_reg0(
        .clock(clock),
        .reset(reset),

        .stop_all(stop_all),

        .program_counter(program_counter),
        .chip_enable(rom_chip_enable),

        .is_branch_input(branch_flag_output),
        .branch_address_input(branch_address_output),

        .flush_input(flush_output),
        .new_program_counter_input(new_program_counter_output)
    );
    
    if_id if_id0(
        .clock(clock), 
        .reset(reset),
        
        .stop_all(stop_all),

        .if_program_counter(program_counter),
        .if_instruction(instruction_input),
        
        .id_program_counter(id_program_counter_input),
        .id_instruction(id_instruction_input),

        .flush_input(flush_output)
    );

    id id0(
        .reset(reset),
        .program_counter_input(id_program_counter_input),
        .instruction_input(id_instruction_input),
        
        .reg1_data_input(reg1_data),
        .reg2_data_input(reg2_data),
        
        .reg1_read_output(reg1_read),
        .reg2_read_output(reg2_read),

        .reg1_address_output(reg1_address),
        .reg2_address_output(reg2_address),

        .is_in_delay_slot_input(is_in_delay_slot),

        .ex_aluop_input(ex_aluop_output),
        .ex_write_reg_enable_intput(ex_write_reg_enable_output),
        .ex_write_reg_data_input(ex_write_reg_data_output),
        .ex_write_reg_address_intput(ex_write_reg_address_output),

        .mem_write_reg_enable_input(mem_write_reg_enable_output),
        .mem_write_reg_data_input(mem_write_reg_data_output),
        .mem_write_reg_address_input(mem_write_reg_address_output),

        .aluop_output(id_aluop_output),
        .alusel_output(id_alusel_output),
        .instruction_ouput(id_instruction_output),
        .reg1_output(id_reg1_output),
        .reg2_output(id_reg2_output),
        .write_reg_address_output(id_write_reg_address_output),
        .write_reg_enable_output(id_write_reg_enable_output),

        .stop_all_req_from_id(stop_all_req_from_id),

        .next_instrcution_in_delay_slot_output(id_next_instrcution_in_delay_slot_output),
        .branch_address_output(branch_address_output),
        .link_address_output(id_link_address_output),
        .is_in_delay_slot_output(id_is_in_delay_slot_output),

        .is_branch_output(branch_flag_output),

        .exception_type_output(id_exception_type_output),
        .current_instruction_address_output(id_current_instruction_address_output)
    );
    
    regfile regfile1(
        .clock(clock),
        .reset(reset),

        .write_enable(wb_write_reg_enable_intput),
        .write_address(wb_write_reg_address_intput),
        .write_data(wb_write_reg_data_intput),

        .read_enable1(reg1_read),
        .read_address1(reg1_address),
        .read_data1(reg1_data),

        .read_enable2(reg2_read),
        .read_address2(reg2_address),
        .read_data2(reg2_data)
    );
    
    id_ex id_ex0(
        .clock(clock),
        .reset(reset),

        .id_aluop_input(id_aluop_output),
        .id_alusel_input(id_alusel_output),
        .id_instuction_input(id_instruction_output),
        .id_reg1_input(id_reg1_output),
        .id_reg2_input(id_reg2_output),
        .id_write_reg_address_input(id_write_reg_address_output),
        .id_write_reg_enable_input(id_write_reg_enable_output),
        
        .flush_input(flush_output),
        .id_exception_type_input(id_exception_type_output),
        .id_current_instruction_address(id_current_instruction_address_output),

        .stop_all(stop_all),

        .ex_aluop_output(ex_aluop_input),
        .ex_alusel_output(ex_alusel_input),
        .ex_instruction_output(ex_instruction_output),
        .ex_reg1_output(ex_reg1_input),
        .ex_reg2_output(ex_reg2_input),
        .ex_write_reg_address_output(ex_write_reg_address_intput),
        .ex_write_reg_enable_output(ex_write_reg_enable_intput),

        .id_is_in_delay_slot_input(id_is_in_delay_slot_output),
        .id_link_address_input(id_link_address_output),
        .id_next_instrcution_in_delay_slot_input(id_next_instrcution_in_delay_slot_output),

        .id_ex_is_in_delay_slot_output(ex_is_in_delay_slot_input),
        .id_ex_link_address_output(ex_link_address_output),
        .is_in_delay_slot_output(is_in_delay_slot),

        .ex_current_instruction_address(ex_current_instruction_address_input),
        .ex_exception_type_output(ex_exception_type_input)
    );

    ex ex0(
        .reset(reset),

        .aluop_input(ex_aluop_input),
        .alusel_input(ex_alusel_input),
        .instruction_input(ex_instruction_output),
        
        .reg1_input(ex_reg1_input),
        .reg2_input(ex_reg2_input),

        .write_reg_address_input(ex_write_reg_address_intput),
        .write_reg_enable_input(ex_write_reg_enable_intput),

        .write_reg_address_output(ex_write_reg_address_output),
        .write_reg_enable_output(ex_write_reg_enable_output),
        .write_reg_data_output(ex_write_reg_data_output),

        .hi_input(hi_output),
        .lo_input(lo_output),

        .hilo_temp_input(ex_mem_hilo_temp_output),
        .count_clock_input(ex_mem_count_clock_output),

        .wb_whilo_input(wb_whilo_output),
        .wb_hi_input(wb_hi_output),
        .wb_lo_input(wb_lo_output),

        .mem_whilo_input(mem_whilo_output),
        .mem_hi_input(mem_hi_output),
        .mem_lo_input(mem_lo_output),

        .div_result_input(div_ex_result_output),
        .div_ready_input(div_ex_ready_output),

        .exception_type_input(ex_exception_type_input),
        .current_instruction_address_input(ex_current_instruction_address_input),

        .whilo_output(ex_whilo_output),
        .hi_output(ex_hi_output),
        .lo_output(ex_lo_output),

        .stop_all_req_from_ex(stop_all_req_from_ex),
        .hilo_temp_output(ex_hilo_temp_output),
        .count_clock_output(ex_count_clock_output),

        .div_start_output(ex_div_start_output),
        .div_data1_output(ex_div_data1_output),
        .div_data2_output(ex_div_data2_output),
        .is_sign_div_output(ex_div_is_sign_div_output),

        .is_in_delay_slot_input(ex_is_in_delay_slot_input),
        .link_address_input(ex_link_address_output),
        
        .aluop_output(ex_aluop_output),
        .memory_address_output(ex_memory_address_output),
        .reg2_output(ex_reg2_output),

        .mem_cp0_reg_write_enable_input(mem_cp0_reg_write_enable_output),
        .mem_cp0_reg_write_address_input(mem_cp0_reg_write_address_output),
        .mem_cp0_reg_data_input(mem_cp0_reg_data_output),

        .wb_cp0_reg_write_enable_input(mem_wb_cp0_reg_write_enable_output),
        .wb_cp0_reg_write_address_input(mem_wb_cp0_reg_write_address_output),
        .wb_cp0_reg_data_input(mem_wb_cp0_reg_data_output),

        .cp0_reg_data_input(cp0_data_output),

        .cp0_reg_write_enable_output(ex_cp0_write_enable_output),
        .cp0_reg_read_address_output(ex_cp0_reg_read_address_output),
        .cp0_reg_write_address_output(ex_cp0_reg_write_address_output),
        .cp0_reg_data_output(ex_cp0_reg_data_output),

        .exception_type_output(ex_exception_type_output),
        .current_instruction_address_output(ex_current_instruction_address_output),
        .is_in_delay_slot_output(ex_is_in_delay_slot_output)
    );
    
    div div0(
        .reset(reset),
        .clock(clock),
        .is_sign_div_input(ex_div_is_sign_div_output),
        .div_data1_input(ex_div_data1_output),
        .div_data2_input(ex_div_data2_output),
        .div_start_input(ex_div_start_output),

        .div_cancel_input(1'b0),

        .div_result_output(div_ex_result_output),
        .div_ready_output(div_ex_ready_output)
    );

    ex_mem ex_mem0(
        .clock(clock),
        .reset(reset),

        .stop_all(stop_all),

        .ex_write_reg_address_intput(ex_write_reg_address_output),
        .ex_write_reg_enable_intput(ex_write_reg_enable_output),
        .ex_write_reg_data_intput(ex_write_reg_data_output),

        .ex_whilo_input(ex_whilo_output),
        .ex_hi_input(ex_hi_output),
        .ex_lo_input(ex_lo_output),
        .hilo_input(ex_hilo_temp_output),
        .count_clock_input(ex_count_clock_output),

        .mem_write_reg_address_output(mem_write_reg_address_input),
        .mem_write_reg_enable_output(mem_write_reg_enable_input),
        .mem_write_reg_data_output(mem_write_reg_data_input),

        .flush_input(flush_output),
        .ex_exception_type(ex_exception_type_output),
        .ex_current_instruction_address(ex_current_instruction_address_output),
        .ex_is_in_delay_slot(ex_is_in_delay_slot_output),

        .mem_whilo_output(mem_whilo_input),
        .mem_hi_output(mem_hi_input),
        .mem_lo_output(mem_lo_input),

        .hilo_output(ex_mem_hilo_temp_output),
        .count_clock_output(ex_mem_count_clock_output),

        .ex_aluop_input(ex_aluop_output),
        .ex_memory_address_input(ex_memory_address_output),
        .ex_reg2_input(ex_reg2_output),

        .mem_aluop_output(mem_aluop_output),
        .mem_memory_address_output(mem_memory_address_output),
        .mem_reg2_output(mem_reg2_output),

        .ex_cp0_reg_write_enable_input(ex_cp0_write_enable_output),
        .ex_cp0_reg_write_address_input(ex_cp0_reg_write_address_output),
        .ex_cp0_reg_data_input(ex_cp0_reg_data_output),

        .mem_cp0_reg_write_enable_output(ex_mem_cp0_reg_write_enable_output),
        .mem_cp0_reg_write_address_output(ex_mem_cp0_reg_write_address_output),
        .mem_cp0_reg_data_output(ex_mem_cp0_reg_data_output),

        .mem_exception_type(mem_exception_type_input),
        .mem_is_in_delay_slot(mem_is_in_delay_slot_input),
        .mem_current_instruction_address(mem_current_instruction_address_input)
    );

    mem mem0(
        .reset(reset),

        .write_reg_address_input(mem_write_reg_address_input),
        .write_reg_enable_input(mem_write_reg_enable_input),
        .write_reg_data_input(mem_write_reg_data_input),

        .whilo_input(mem_whilo_input),
        .hi_input(mem_hi_input),
        .lo_input(mem_lo_input),

        .write_reg_address_output(mem_write_reg_address_output),
        .write_reg_enable_output(mem_write_reg_enable_output),
        .write_reg_data_output(mem_write_reg_data_output),

        .exception_type_input(mem_exception_type_input),
        .current_instruction_address_input(mem_current_instruction_address_input),
        .is_in_delay_slot_input(mem_is_in_delay_slot_input),

        .cp0_status_input(cp0_status_output),
        .cp0_cause_input(cp0_cause_output),
        .cp0_epc_input(cp0_epc_output),

        .wb_cp0_reg_write_enable(mem_wb_cp0_reg_write_enable_output),
        .wb_cp0_reg_write_address(mem_wb_cp0_reg_write_address_output),
        .wb_cp0_reg_data(mem_wb_cp0_reg_data_output),

        .whilo_output(mem_whilo_output),
        .hi_output(mem_hi_output),
        .lo_output(mem_lo_output),

        .LLbit_input(LLbit_output),
        .wb_LLbit_write_enable_input(wb_LLbit_write_enable_output),
        .wb_LLbit_input(wb_LLbit_output),

        .aluop_input(mem_aluop_output),
        .memory_address_input(mem_memory_address_output),
        .reg2_input(mem_reg2_output),

        .memory_data_input(ram_data_input),
        .memory_address_output(ram_address_output),
        .memory_write_enable_output(ram_write_enable_output),
        .memory_sel_output(ram_sel_output),
        .memory_data_output(ram_data_output),
        .memory_chip_enable_output(ram_chip_enable),

        .LLbit_write_enable_output(mem_LLbit_write_enable_output),
        .LLbit_output(mem_LLbit_output),

        .cp0_reg_write_enable_input(ex_mem_cp0_reg_write_enable_output),
        .cp0_reg_write_address_input(ex_mem_cp0_reg_write_address_output),
        .cp0_reg_data_input(ex_mem_cp0_reg_data_output),

        .cp0_reg_write_enable_output(mem_cp0_reg_write_enable_output),
        .cp0_reg_write_address_output(mem_cp0_reg_write_address_output),
        .cp0_reg_data_output(mem_cp0_reg_data_output),

        .cp0_epc_output(mem_cp0_epc_output),
        .exception_type_output(mem_exception_type_output),
        .current_instruction_address_output(mem_current_instruction_address_output),
        .is_in_delay_slot_output(mem_is_in_delay_slot_output)
    );
    
    mem_wb mem_wb0(
        .clock(clock),
        .reset(reset),

        .mem_write_reg_address_input(mem_write_reg_address_output),
        .mem_write_reg_enable_input(mem_write_reg_enable_output),
        .mem_write_reg_data_input(mem_write_reg_data_output),

        .mem_whilo_input(mem_whilo_output),
        .mem_hi_input(mem_hi_output),
        .mem_lo_input(mem_lo_output),

        .stop_all(stop_all),

        .flush_input(flush_output),

        .mem_LLbit_write_enable_input(mem_LLbit_write_enable_output),
        .mem_LLbit_input(mem_LLbit_output),

        .wb_write_reg_address_output(wb_write_reg_address_intput),
        .wb_write_reg_enable_output(wb_write_reg_enable_intput),
        .wb_write_reg_data_output(wb_write_reg_data_intput),

        .wb_whilo_output(wb_whilo_output),
        .wb_hi_output(wb_hi_output),
        .wb_lo_output(wb_lo_output),

        .wb_LLbit_write_enable_output(wb_LLbit_write_enable_output),
        .wb_LLbit_output(wb_LLbit_output),

        .mem_cp0_reg_write_enable_input(mem_cp0_reg_write_enable_output),
        .mem_cp0_reg_write_address_input(mem_cp0_reg_write_address_output),
        .mem_cp0_reg_data_input(mem_cp0_reg_data_output),

        .wb_cp0_reg_write_enable_output(mem_wb_cp0_reg_write_enable_output),
        .wb_cp0_reg_write_address_output(mem_wb_cp0_reg_write_address_output),
        .wb_cp0_reg_data_output(mem_wb_cp0_reg_data_output)
    );

    cp0_reg cp0_reg0(
        .clock(clock),
        .reset(reset),

        .interrupt_input(interrupt_input),

        .write_enable_input(mem_wb_cp0_reg_write_enable_output),
        .write_address_input(mem_wb_cp0_reg_write_address_output),
        .read_address_input(ex_cp0_reg_read_address_output),
        .data_input(mem_wb_cp0_reg_data_output),
        
        .exception_type_input(mem_exception_type_output),
        .current_instruction_address_input(mem_current_instruction_address_output),
        .is_in_delay_slot_input(mem_is_in_delay_slot_output),

        .data_output(cp0_data_output),
        .count_output(cp0_count_output),
        .compare_output(cp0_compare_output),
        .status_output(cp0_status_output),
        .cause_output(cp0_cause_output),
        .epc_output(cp0_epc_output),
        .config_output(cp0_config_output),
        .prid_output(cp0_prid_output),
        .timer_interrupt_output(timer_interrupt_output)
    );

    LLbit_reg LLbit_reg0(
        .clock(clock),
        .reset(reset),
        .flush(flush_output),
        .LLbit_input(wb_LLbit_write_enable_output),
        .write_enable(wb_LLbit_output),
        .LLbit_output(LLbit_output)
    );

    hilo_reg hilo_reg0(
        .clock(clock),
        .reset(reset),

        .write_enable(wb_whilo_output),
        .hi_input(wb_hi_output),
        .lo_input(wb_lo_output),

        .hi_output(hi_output),
        .lo_output(lo_output)
    );

    wishbone_bus_interface inst_wishbone_bus_interface(
        .clock(clock),
        .reset(reset),

        .stop_all_input(stop_all),
        .flush_input(flush_output),

        .cpu_chip_enable_input(rom_chip_enable),
        .cpu_data_input(32'h00000000),
        .cpu_address_input(program_counter),
        .cpu_write_enable_input(1'b0),
        .cpu_sel_input(4'b1111),
        .cpu_data_output(instruction_input),

        .wishbone_data_input(iwishbone_data_input),
        .wishbone_ack_input(iwishbone_ack_input),
        .wishbone_address_output(iwishbone_address_output),
        .wishbone_data_output(iwishbone_data_output),
        .wishbone_write_enable_output(iwishbone_write_enable_output),
        .wishbone_sel_output(iwishbone_sel_output),
        .wishbone_stb_output(iwishbone_stb_output),
        .wishbone_cyc_output(iwishbone_cyc_output),

        .stop_all_req_output(stop_all_req_from_if)
    );

    wishbone_bus_interface data_wishbone_bus_interface(
        .clock(clock),
        .reset(reset),

        .stop_all_input(stop_all),
        .flush_input(flush_output),

        .cpu_chip_enable_input(rom_chip_enable),
        .cpu_data_input(32'h00000000),
        .cpu_address_input(program_counter),
        .cpu_write_enable_input(1'b0),
        .cpu_sel_input(4'b1111),
        .cpu_data_output(instruction_input),

        .wishbone_data_input(dwishbone_data_input),
        .wishbone_ack_input(dwishbone_ack_input),
        .wishbone_address_output(dwishbone_address_output),
        .wishbone_data_output(dwishbone_data_output),
        .wishbone_write_enable_output(dwishbone_write_enable_output),
        .wishbone_sel_output(dwishbone_sel_output),
        .wishbone_stb_output(dwishbone_stb_output),
        .wishbone_cyc_output(dwishbone_cyc_output),

        .stop_all_req_output(stop_all_req_from_mem)
    );
     
endmodule