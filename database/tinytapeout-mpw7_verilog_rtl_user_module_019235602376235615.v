// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

// Keep I/O fixed for TinyTapeout
module user_module_019235602376235615(
  input [7:0] io_in, 
  output [7:0] io_out
);

    // 6bit angles and 6 bit outputs
    // y0 = 0, x0 = 0.60728

    /*
    How to convert angles to binary angles:
    angle = 180/62*bin_angle

    Convert sine and cosine values to binary:
    value = 2/62*bin_value
    */

    wire clk = io_in[0];
    wire reset = io_in[1];
    wire [5:0] z0 = io_in[7:2]; // input angle supports from -90 to +90 degrees

    // ROM
    reg [5:0]x0;
    reg [5:0]angle[5:0];
    always @(posedge clk) begin
        x0 <= 6'd19; // x0 = 0.60728
        angle[0] <= 6'd16; // angle 0 = 45
        angle[1] <= 6'd9; // angle 1 = 26.565
        angle[2] <= 6'd5; // angle 2 = 14.036
        angle[3] <= 6'd2; // angle 3 = 7.125
        angle[4] <= 6'd1; // angle 4 = 3.576
        angle[5] <= 6'd1; // angle 5 = 1.7899
    end

    // Registers 
    reg [5:0] reg_x, reg_y, reg_x_next, reg_y_next, reg_z, reg_z_next;
    reg en;
    always @(posedge clk) begin
        if (reset) begin
            reg_x <= x0;
            reg_y <= 0;
            reg_z <= z0;
        end else if (en) begin
            reg_x <= reg_x_next;
            reg_y <= reg_y_next;
            reg_z <= reg_z_next;
        end
    end

    // ALU
    wire d;
    assign d = reg_z[5];
    always @(*) begin

        if (d) begin // if d then x is add and y is sub and z is add
                    reg_x_next <= reg_x + ($signed(reg_y) >>> i);
                    reg_y_next <= reg_y - ($signed(reg_x) >>> i);
                    reg_z_next <= reg_z + angle[i];
                end else begin // if !d then x is sub and y is add and z is sub
                    reg_x_next <= reg_x - ($signed(reg_y) >>> i);
                    reg_y_next <= reg_y + ($signed(reg_x) >>> i);
                    reg_z_next <= reg_z - angle[i];
        end


    end


    // Control unit
    reg [1:0] state;
    `define RESET 2'b0
    `define CALC 2'd1
    `define DONE 2'd2
    reg [2:0]i;
    reg done;
    always @(posedge clk) begin
        case (state)
            `RESET: begin
                done <= 0;
                i <= 0;
                
                if (!reset) begin
                    state <= `CALC;
                    en <= 1;
                end
                    
            end
            `CALC: begin
                if ( i < 5) begin
                    i <= i+1;
                    if (i == 4)
                        en <= 0;
                end
                    
                else begin
                    state <= `DONE;
                    
                end
            end
            `DONE: begin
                done <= 1;
                if (reset) 
                    state <= `RESET;
            end
            default: begin
                state <= 0;
            end

        endcase
    end

    // Ooutput controler
    assign io_out[7] = done;
    wire x_yb;
    assign x_yb = clk;
    assign io_out[6] = x_yb;
    wire [5:0] data_out;
    assign io_out[5:0] = data_out;

    assign data_out = (done) ? (clk) ? reg_x : reg_y : 0;

 
endmodule
