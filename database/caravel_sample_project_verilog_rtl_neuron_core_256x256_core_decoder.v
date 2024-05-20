// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

// Memory map
// slice0:          0x3000_0000 - 0x3000_0FFF
// slice1:          0x3000_1000 - 0x3000_1FFF
// slice2:          0x3000_2000 - 0x3000_2FFF
// slice3:          0x3000_3000 - 0x3000_3FFF
// slice4:          0x3000_4000 - 0x3000_4FFF
// slice5:          0x3000_5000 - 0x3000_5FFF
// slice6:          0x3000_6000 - 0x3000_6FFF
// slice7:          0x3000_7000 - 0x3000_7FFF
// choose_weight:   0x3000_0800 - 0x3000_083F
// done_pic:        0x3000_0840

module core_decoder (
    input [31:0] addr,
    input wbs_we_i,
    output reg [NUM_OF_SLICE-1:0] slice,
    output reg choose_weight,
    output reg picture_done,
    output reg send_spike
);
    parameter NUM_OF_SLICE = 8;
    parameter DONE_PIC_ADDR = 32'h30000840;
    parameter CHOOSE_WEIGHT_BASE = 32'h30000800;

    always @(addr) begin
        // Default outputs to 0
        slice = 0;
        send_spike = 0;
        choose_weight = 0;
        picture_done = 0;

        // Decode based on addr[14:12]
        case (addr[14:12])
            0: begin
                if (addr[11]) begin
                    choose_weight = !(addr[6]);
                    picture_done = (addr==DONE_PIC_ADDR);
                end
                else begin
                    if (!(wbs_we_i || addr[10]) ) begin
                        slice = 8'b11111111;
                        send_spike = 1;
                    end
                    else begin  //addr[10] and wbs_we not both = 1
                        slice[0] = 1;
                    end
                end
            end

            1: begin
                slice[1] = 1;
            end

            2: begin
                slice[2] = 1;
            end

            3: begin
                slice[3] = 1;
            end

            4: begin
                slice[4] = 1;
            end

            5: begin
                slice[5] = 1;
            end

            6: begin
                slice[6] = 1;
            end

            7: begin
                slice[7] = 1;
            end

            default:; 
        endcase
    end

endmodule
