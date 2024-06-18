// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module ClkDivider #(
    parameter COUNTER_BITS = 32,
    parameter PULSE_BITS = 32
)(
    input wire clk,
    input wire reset,
    input wire write_pulse,
    input wire option, // 0 - pulse, 1 - auto
    input wire out_enable, // 0 not, 1 - yes
    input wire [COUNTER_BITS - 1:0] divider,
    input wire [PULSE_BITS - 1:0] pulse,
    output wire clk_o
);

wire clk_o_pulse;
reg clk_o_auto;
reg [COUNTER_BITS - 1:0] clk_counter;
reg [PULSE_BITS - 1:0] pulse_counter;

assign clk_o = (out_enable == 1'b1) ? (option == 1'b0) ? 
    clk_o_pulse : clk_o_auto : 1'b0; // multiplexador da saida

assign clk_o_pulse = (pulse_counter != 32'd0) 
                    ? clk : 1'b0; // liga a saida ao clock enquanto o 
                                // contador de pulsos for maior do que 0

initial begin
    clk_counter = 32'd0;
    clk_o_auto = 1'b0;
    pulse_counter = 32'd0;
end

always @(posedge clk ) begin
    if(reset == 1'b1) begin
        clk_counter <= 32'd0;
        clk_o_auto <= 32'd0;
    end else begin
        if(clk_counter == 0) begin // Gera a parte alta do ciclo de clock de saida
            clk_o_auto <= 1'b1;
            clk_counter <= clk_counter + 1'b1;
        end else if(clk_counter == {1'b0, divider[COUNTER_BITS-1:1]}) begin // Inverte a saida do clock para a parte baixa
            clk_o_auto <= 1'b0;
            clk_counter <= clk_counter + 1'b1;
        end else begin
            clk_counter <= clk_counter + 1'b1; // inclementa o contador
        end

        if(clk_counter >= divider - 1) begin // para o caso em especifico em que a divisão e por 2
            clk_counter <= 32'd0;
        end
    end
end

always @(posedge clk ) begin
    if(reset == 1'b1) begin
        pulse_counter <= 32'd0;
    end else begin
        if(write_pulse == 1'b1) begin
            pulse_counter <= pulse;
        end

        if(pulse_counter > 32'd0) begin
            pulse_counter <= pulse_counter - 1'b1;
        end
    end
end

endmodule