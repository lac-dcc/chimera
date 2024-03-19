//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------


module altera_spram #(
    parameter   DEVICE_ID   = "Stratix IV"  ,   //
                BRAM_TYPE   = "M9K"         ,   //
                RAM_DO_REG  = 0             ,   //
                RAM_WIDTH   = 8             ,   //
                RAM_DEEP    = 10                //

    )(
        input                               reset       ,   //i1: reset only for mlab
        input                               clock       ,   //i1: single port ram clock
        input                               wren        ,   //i1: write enable
        input           [RAM_WIDTH - 1:0]   wdata       ,   //i[RAM_WIDTH]:
        input           [RAM_DEEP - 1:0]    address     ,   //i[RAM_WIDTH]:
        input                               ren         ,   //i1: read enable
        output  wire    [RAM_WIDTH - 1:0]   q               //o[RAM_WIDTH]:
    );

//--------------------------
//  parameters
//--------------------------
localparam  RAM_DOUT_REG    = (RAM_DO_REG == 1) ? "CLOCK0" : "UNREGISTERED";

//--------------------------
//  signals
//--------------------------

//-------------------------------------------------------------
//  process
//-------------------------------------------------------------

    altsyncram  altsyncram_component (
                .address_a  (address    ),
                .clock0     (clock      ),
                .data_a     (wdata      ),
                .rden_a     (ren        ),
                .wren_a     (wren       ),
                .q_a        (q          ),
                .address_b  (1'b1   ),
                .aclr0 (1'b0),
                .aclr1 (1'b0),
                .addressstall_a (1'b0),
                .addressstall_b (1'b0),
                .byteena_a (1'b1),
                .byteena_b (1'b1),
                .clock1 (clock),
                .clocken0 (1'b1),
                .clocken1 (1'b1),
                .clocken2 (1'b1),
                .clocken3 (1'b1),
                .data_b (1'b1),
                .eccstatus (),
                .q_b (),
                .rden_b (1'b1),
                .wren_b (1'b0));
    defparam
        altsyncram_component.clock_enable_input_a = "BYPASS",
        altsyncram_component.clock_enable_input_b = "BYPASS",
        altsyncram_component.enable_ecc = "FALSE",
        altsyncram_component.intended_device_family = DEVICE_ID,
        altsyncram_component.lpm_type = "altsyncram",
        altsyncram_component.numwords_a = 2**RAM_DEEP,
        altsyncram_component.operation_mode = "SINGLE_PORT",
        altsyncram_component.outdata_aclr_a = "NONE",
        altsyncram_component.outdata_reg_a = RAM_DOUT_REG,
        altsyncram_component.read_during_write_mode_port_a = "OLD_DATA",
        altsyncram_component.power_up_uninitialized = "FALSE",
        altsyncram_component.ram_block_type = BRAM_TYPE,
        altsyncram_component.widthad_a = RAM_DEEP,
        altsyncram_component.width_a = RAM_WIDTH,
        altsyncram_component.width_byteena_a = 1;

endmodule
