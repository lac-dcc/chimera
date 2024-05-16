//`include "config.inc"

module TFP410(
    input clk,
    input reset,
    input output_ready,

    inout sda,
    inout scl,
    output reg ready,
    output reg hpd_detected
);

reg [6:0] i2c_chip_addr;
reg [7:0] i2c_reg_addr;
reg [7:0] i2c_value;
reg i2c_enable;
reg i2c_is_read;

wire [7:0] i2c_data;
wire i2c_done;
wire i2c_ack_error;

I2C I2C(
    .clk           (clk),
    .reset         (1'b1),

    .chip_addr     (i2c_chip_addr),
    .reg_addr      (i2c_reg_addr),
    .value         (i2c_value),
    .enable        (i2c_enable),
    .is_read       (i2c_is_read),

    .sda           (sda),
    .scl           (scl),

    .data          (i2c_data),
    .done          (i2c_done),
    .i2c_ack_error (i2c_ack_error),

    .divider       (32'h_C8_96_64_32)
);

(* syn_encoding = "safe" *) 
reg [1:0] state;
reg [2:0] cmd_counter;
reg [5:0] subcmd_counter;

localparam CHIP_ADDR = 7'h38;
localparam  s_start  = 0,
            s_wait   = 1,
            s_wait_2 = 2,
            s_idle   = 3;
localparam  cs_pwrdown  = 3'd0,
            cs_init     = 3'd1,
            cs_init2    = 3'd2,
            cs_pllcheck = 3'd3,
            cs_hpdcheck = 3'd4,
            cs_ready    = 3'd5;
localparam  scs_start = 6'd0;

initial begin
    ready <= 0;
end

reg [32:0] counter = 0;

always @ (posedge clk) begin
    if (~reset) begin
        state <= s_start;
        cmd_counter <= cs_pwrdown;
        subcmd_counter <= scs_start;
        i2c_enable <= 1'b0;
    end else begin
        case (state)
            s_start: begin
                if (i2c_done) begin
                    case (cmd_counter)
                        cs_pwrdown: begin
                            ready <= 1'b0;
                            powerdown(cs_init);
                        end
                        cs_init: monitor_hpd(cs_init2, cs_pwrdown);
                        cs_init2: init(cs_pllcheck);
                        cs_pllcheck: pllcheck(cs_ready, cs_pllcheck);

                        cs_hpdcheck: monitor_hpd(cs_ready, cs_pwrdown);

                        default: begin
                            cmd_counter <= cs_init;
                            subcmd_counter <= scs_start;
                            state <= s_idle;
                            ready <= 1'b1;
                        end
                    endcase
                end
            end
            
            s_wait: begin
                state <= s_wait_2;
            end
            
            s_wait_2: begin
                i2c_enable <= 1'b0;
                
                if (i2c_done) begin
                    if (~i2c_ack_error) begin
                        subcmd_counter <= subcmd_counter + 1'b1;
                    end
                    state <= s_start;
                end
            end

            s_idle: begin
                if (~output_ready) begin
                    state <= s_start;
                    cmd_counter <= cs_pwrdown;
                    subcmd_counter <= scs_start;
                end else if (counter == 32'd_16_000_000) begin
                    state <= s_start;
                    cmd_counter <= cs_hpdcheck;
                    subcmd_counter <= scs_start;
                    counter <= 1'b0;
                end else begin
                    counter <= counter + 1'b1;
                end
            end
            
        endcase
    end
end

task write_i2c;
    input [6:0] t_chip_addr;
    input [15:0] t_data;

    begin
        i2c_chip_addr <= t_chip_addr;
        i2c_reg_addr  <= t_data[15:8];
        i2c_value     <= t_data[7:0];
        i2c_enable    <= 1'b1;
        i2c_is_read   <= 1'b0;
        state         <= s_wait;
    end
endtask

task read_i2c;
    input [6:0] t_chip_addr;
    input [7:0] t_addr;

    begin
        i2c_chip_addr <= t_chip_addr;
        i2c_reg_addr  <= t_addr;
        i2c_enable    <= 1'b1;
        i2c_is_read   <= 1'b1;
        state         <= s_wait;
    end
endtask

// ----------------------------------------------------------------
task monitor_hpd;
    input [2:0] success_cmd;
    input [2:0] failure_cmd;

    begin
        case (subcmd_counter)
            0: write_i2c(CHIP_ADDR, 16'h_09_01); // -> clears interrupt state, mark all interrupts as detected
            // check status
            1: read_i2c(CHIP_ADDR, 8'h_09);
            2: begin
                if (i2c_data[2] && i2c_data[1]) begin
                    cmd_counter <= success_cmd;
                    subcmd_counter <= scs_start;
                    hpd_detected <= 1'b1;
                end else begin
                    cmd_counter <= failure_cmd;
                    subcmd_counter <= scs_start;
                    hpd_detected <= 1'b0;
                end
            end
        endcase
    end
endtask

task init;
    input [2:0] next_cmd;

    begin
        case (subcmd_counter)
            0: write_i2c(CHIP_ADDR, 16'h_08_BF); // CTL_1_MODE
            1: write_i2c(CHIP_ADDR, 16'h_09_00); // CTL_2_MODE
            2: write_i2c(CHIP_ADDR, 16'h_0A_80); // CTL_3_MODE
            3: write_i2c(CHIP_ADDR, 16'h_33_00); // DE_CTL
            default: begin
                cmd_counter <= next_cmd;
                subcmd_counter <= scs_start;
            end
        endcase
    end
endtask

task powerdown;
    input [2:0] next_cmd;

    begin
        case (subcmd_counter)
            0: write_i2c(CHIP_ADDR, 16'h_08_FE); // CTL_1_MODE
            default: begin
                cmd_counter <= next_cmd;
                subcmd_counter <= scs_start;
            end
        endcase
    end
endtask

task pllcheck;
    input [2:0] success_cmd;
    input [2:0] failure_cmd;

    begin
        case (subcmd_counter)
            0: begin
                if (output_ready) begin
                    // proceed to next command
                    subcmd_counter <= subcmd_counter + 1'b1;
                end else begin
                    cmd_counter <= failure_cmd;
                    subcmd_counter <= scs_start;
                end
            end
            default: begin
                cmd_counter <= success_cmd;
                subcmd_counter <= scs_start;
            end
        endcase
    end
endtask

endmodule
