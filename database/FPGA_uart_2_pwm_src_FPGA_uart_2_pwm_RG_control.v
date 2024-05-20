// This program was cloned from: https://github.com/asier-vega-gutierrez/FPGA_uart_2_pwm
// License: MIT License


module PWM_control(
    input clk,
    input[31:0] in_pwm,
    output pin_pwm
);
    
    //El servo tiene un periodo de 20_000_000, pero solo lee la señal hasta 2_000_000, por eso son 20 bits
    //Constantes del servo
    parameter PULSE_WIDTH_MAX = 20_000_000 / 37;
    parameter PULSE_WIDTH_MIN = 0;

    //Variables
    //Variable con el periodo de completo 20_000 micos
    reg[19:0] pwm_period; //2^19-1 = 1_048_575 -> necesito 20_000_000/37
    //Varaible contador
    reg[19:0] clk_count = 20'b0; //tamaño igual al periodo
    //Variable de movimiento de servo (Debug)
    //reg[19:0] in_pwm = (500_000 / 37);
    //Varaible de ancho de pulso objetivo
    reg[31:0] pwm_width;

    //Recalculamos el pwm si nos pasamos de los limites
    always @(posedge clk) begin
        if(in_pwm > PULSE_WIDTH_MAX) begin
            pwm_width <= PULSE_WIDTH_MAX;
        end else if (in_pwm < PULSE_WIDTH_MIN) begin
            pwm_width <= PULSE_WIDTH_MIN;
        end else begin
            pwm_width <= in_pwm;
        end
    end
    
    //Calculamos el valor a contar por el contador
    always @(posedge clk) begin
        pwm_period <= (20_000_000 / 37); // 20_000 micros pwm // f = 27MHz T = 1/27*10^6 -> T 37.37ns
    end

    //Realizamos el conteo del reloj
    always @(posedge clk) begin
        if(clk_count == pwm_period - 1)begin
            clk_count <= 20'b0;
        end else begin
            clk_count <= clk_count + 1'b1;
        end
    end
    
    //Asignamos el valor segun el periodo
    assign pin_pwm = (clk_count <= in_pwm) ? 1'b1 : 1'b0;
    

endmodule