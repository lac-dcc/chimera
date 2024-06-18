// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module mul(input signed [31:0] m, q, output [63:0] out);

    reg [2:0] bit_pairs [15:0];
    reg signed [32:0] hold [15:0];
    reg signed [63:0] shifted_hold [15:0];
    reg signed [63:0] sum = 0;
    
    wire signed [32:0] neg_m;
    assign neg_m = -m;

    integer i, j;
    always@(m or q or neg_m) begin
        // Implement bit pair recoding
        bit_pairs[0] = {q[1], q[0], 1'b0};
        for(i = 1; i < 16; i = i + 1) begin
            bit_pairs[i] = {q[2*i+1], q[2*i], q[2*i-1]};
        end

        for(i = 0; i < 16; i = i + 1) begin
            case (bit_pairs[i])
                3'b001, 3'b010 :  hold[i] = {m[31], m};
                3'b011 : hold[i] = {m, 1'b0};
                3'b100 : hold[i] = {neg_m[31:0], 1'b0};
                3'b101, 3'b110 : hold[i] = neg_m;
                default: hold[i] = 0;

                
            endcase
            shifted_hold[i] = hold[i] << (2*i);
        end
        sum = shifted_hold[0];
        for(i = 1; i < 16; i = i + 1) begin
            sum = sum + shifted_hold[i];
        end
    end
    assign out = sum;
endmodule