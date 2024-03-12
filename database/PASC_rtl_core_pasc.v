// 
// Copyright 2013 Jeff Bush
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// 

module pasc
    #(parameter NUM_CORES = 16)

    (input              clk,
    output reg          output_enable,
    output reg [$clog2(NUM_CORES) - 1:0] output_core_id,
    output reg [15:0]   output_data_val,

    input               axi_we,
    input  [15:0]       axi_addr,
    input  [15:0]       axi_data,
    output [15:0]       axi_q);
    
    reg reset;
    wire[$clog2(NUM_CORES) - 1:0] device_core_id;
    wire device_write_en;
    wire device_read_en;
    wire[9:0] device_addr;
    wire[15:0] device_data_out;
    reg[15:0] device_data_in;

    cluster #(.NUM_CORES(NUM_CORES)) cluster(
        .clk(clk),
        .reset(reset),
        .device_core_id(device_core_id),
        .device_write_en(device_write_en),
        .device_read_en(device_read_en),
        .device_addr(device_addr),
        .device_data_out(device_data_out),
        .device_data_in(device_data_in),
        .axi_we(axi_we),
        .axi_addr(axi_addr),
        .axi_data(axi_data),
        .axi_q(axi_q));

    reg[$clog2(NUM_CORES) - 1:0] sem_holder0;
    reg sem_held0;
    reg[$clog2(NUM_CORES) - 1:0] sem_holder1;
    reg sem_held1;
    reg[7:0] reset_count;

    initial
    begin
        reset = 1;  // FPGA initialization
        reset_count = 0;
    end

    always @(posedge clk)
    begin
        // Release reset after 8 clock cycles if there was no AXI write request.
        reset <= axi_we ? 1'h1 : reset;
        reset_count <= axi_we ? 1'b0 : { reset_count[6:0], 1'b1 };
        
        if (reset_count == 8'b11111111)
            reset <= 0;
    end

    always @(posedge clk, posedge reset)
    begin
        if (reset)
        begin
            device_data_in <= 0;
            sem_holder0 <= 0;
            sem_held0 <= 0;
            sem_holder1 <= 0;
            sem_held1 <= 0;
            output_enable <= 0;
            output_core_id <= 0;
            output_data_val <= 0;
        end
        else
        begin
            // Output
            if (device_addr == 'h3ff && device_write_en)
            begin
                output_enable <= 1;
                output_core_id <= device_core_id;
                output_data_val <= device_data_out;
            end
            else
                output_enable <= 0;
        
            case (device_addr)
                // Mutex 0
                'h3fe: 
                begin
                    if (device_write_en)
                    begin
                        if (device_data_out == 0 && sem_holder0 == device_core_id)
                            sem_held0 <= 0; // Release mutex
                        else if (device_data_out && !sem_held0)
                        begin
                            // Acquire mutex
                            sem_held0 <= 1;
                            sem_holder0 <= device_core_id;
                        end
                    end
                    else
                    begin
                        // Check if mutex is held
                        device_data_in <= sem_held0 && sem_holder0 == device_core_id;
                    end
                end

                // Mutex 1
                'h3fd: 
                begin
                    if (device_write_en)
                    begin
                        if (device_data_out == 0 && sem_holder1 == device_core_id)
                            sem_held1 <= 0; // Release mutex
                        else if (device_data_out && !sem_held1)
                        begin
                            // Acquire mutex
                            sem_held1 <= 1;
                            sem_holder1 <= device_core_id;
                        end
                    end
                    else
                    begin
                        // Check if mutex is held
                        device_data_in <= sem_held1 && sem_holder1 == device_core_id;
                    end
                end
            endcase
        end
    end
endmodule
