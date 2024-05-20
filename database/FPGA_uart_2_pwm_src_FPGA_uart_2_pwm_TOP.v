// This program was cloned from: https://github.com/asier-vega-gutierrez/FPGA_uart_2_pwm
// License: MIT License




module TOP (
    input clk,
    
    //PWM
    output pin_pwm_red,
    output pin_pwm_green,

    //Uart
    input reset_uart, // Slide switches.
    input wire uart_rx, // UART Recieve pin.
    output wire uart_tx, // UART transmit pin.

    //Control
    output[7:0] control_leds
);

    //Numero de bytes por paquete 8 siempre
    parameter PAYLOAD_BITS = 8; 


    //---RX---

    //Posibles estados
    localparam STEPS_RX_0 = 0;
    localparam STEPS_RX_1 = 1;
    localparam STEPS_RX_2 = 2;
    localparam STEPS_RX_3 = 3;
    
    //Registro para establecer estados
    reg[1:0] state_rx = 0;

    //Registro para enviar datos
    wire[PAYLOAD_BITS-1:0] uart_rx_data;
    wire uart_rx_valid;

    //Bytes de batos utiles que se van a recibir
    reg[23:0] uart_rx_bytes;

    //Secuencia de recpecion de datos
    always @(posedge clk) begin
        //Siempre y cuando no realicemos un reset
        if (!reset_uart) begin
            //Este case va recepcionanado los bytes en orden hasta recivir el byte de fin de mensaje
            case (state_rx)
                STEPS_RX_0: begin
                    //En esta etapa almacenomos el primer byte, siempre y cunado el valor de rx sea valido
                    if(uart_rx_valid == 1'b1) begin
                        uart_rx_bytes[23:16] <= uart_rx_data;
                    end
                    state_rx <= (uart_rx_valid == 1'b1) ? STEPS_RX_1 : STEPS_RX_0;
                end
                STEPS_RX_1: begin
                    //En esta etapa almacenomos el segundo byte, siempre y cuando el valor de rx sea valido
                    if(uart_rx_valid == 1'b1) begin
                        uart_rx_bytes[15:8] <= uart_rx_data;
                    end
                    state_rx <= (uart_rx_valid == 1'b1) ? STEPS_RX_2 : STEPS_RX_1;
                end
                STEPS_RX_2: begin
                    //En esta etapa almacenomos el tercer byte, siempre y cuando el valor de rx sea valido
                    if(uart_rx_valid == 1'b1) begin
                        uart_rx_bytes[7:0] <= uart_rx_data;
                    end
                    state_rx <= (uart_rx_valid == 1'b1) ? STEPS_RX_3 : STEPS_RX_2;
                end
                STEPS_RX_3: begin
                    //En esta etapa comprovamos que el byte sea "\n" de fin de mensaje
                    state_rx <= (uart_rx_data == 8'b00001010 && uart_rx_valid == 1'b1) ? STEPS_RX_0 : STEPS_RX_3;
                end
            endcase
        end else begin
            //En el caso de hacer reset establcemos los bytes a 0 y volvemos a empezar las lecturas
            uart_rx_bytes <= 24'b0;
            state_rx <= STEPS_RX_0;
        end
    end

    //Lectura de bytes de entrada
    uart_rx rx(
        .i_clk(clk), //reloj
        .i_resetn(~reset_uart), //reset
        .i_uart_rxd(uart_rx), //Pin de recepcion de datos
        .i_uart_rx_en(1'b1), //Habilitar deshabilitar la recepcion
        .o_uart_rx_break(), //Se activa si se ha cortado el envio
        .o_uart_rx_valid(uart_rx_valid), //Se activa si los datos recibidos son validos
        .o_uart_rx_data(uart_rx_data) //Datos del envio
    );
    
   //Para pintar un byte en leds
    assign control_leds[0] = uart_rx_bytes[16];
    assign control_leds[1] = uart_rx_bytes[17];
    assign control_leds[2] = uart_rx_bytes[18];
    assign control_leds[3] = uart_rx_bytes[19];
    assign control_leds[4] = uart_rx_bytes[20];
    assign control_leds[5] = uart_rx_bytes[21];
    assign control_leds[6] = uart_rx_bytes[22];
    assign control_leds[7] = uart_rx_bytes[23];
    
    /*assign control_leds[0] = uart_rx_bytes[8];
    assign control_leds[1] = uart_rx_bytes[9];
    assign control_leds[2] = uart_rx_bytes[10];
    assign control_leds[3] = uart_rx_bytes[11];
    assign control_leds[4] = uart_rx_bytes[12];
    assign control_leds[5] = uart_rx_bytes[13];
    assign control_leds[6] = uart_rx_bytes[14];
    assign control_leds[7] = uart_rx_bytes[15];*/
    
    /*assign control_leds[0] = uart_rx_bytes[0];
    assign control_leds[1] = uart_rx_bytes[1];
    assign control_leds[2] = uart_rx_bytes[2];
    assign control_leds[3] = uart_rx_bytes[3];
    assign control_leds[4] = uart_rx_bytes[4];
    assign control_leds[5] = uart_rx_bytes[5];
    assign control_leds[6] = uart_rx_bytes[6];
    assign control_leds[7] = uart_rx_bytes[7];*/


    //---TRANSFORMATION--- 
       
    //Pasamos los byts a la relacion con el pwm
    wire[63:0] bytes_to_pwm_x = (uart_rx_bytes[23:16] * 20_000_000) / 1023;
    wire[63:0] bytes_to_pwm_y = (uart_rx_bytes[15:8] * 20_000_000) / 1023;
    //Convertimos la señal en conteo de nuestro frecuencia
    wire[31:0] pwm_x = bytes_to_pwm_x / 37; 
    wire[31:0] pwm_y = bytes_to_pwm_y / 37; 

    //---PWM---

    PWM_control red(
        .clk(clk), //reloj 
        .in_pwm(pwm_x), //ancho de pulso pwm
        .pin_pwm(pin_pwm_red) //linea para pwm
    );

    PWM_control green(
        .clk(clk), //reloj 
        .in_pwm(pwm_y), //ancho de pulso pwm
        .pin_pwm(pin_pwm_green) //linea para pwm
    );


    //---TX---
    
    //Posibles estados
    localparam STEPS_TX_0 = 0;
    localparam STEPS_TX_1 = 1;
    localparam STEPS_TX_2 = 2;
    localparam STEPS_TX_3 = 3;
    localparam STEPS_TX_4 = 4;
    localparam STEPS_TX_5 = 5;
    localparam STEPS_TX_6 = 6;
    localparam STEPS_TX_7 = 7;

    //Registro para establecer estados
    reg[2:0] state_tx = 0;

    //Registro para enviar datos
    reg[PAYLOAD_BITS-1:0] uart_tx_data;
    //Variable de control de tx
    wire uart_tx_busy;

    //Bytes de batos utiles a enviar
    //reg[23:0] uart_tx_bytes = {8'd20, 8'd0, 8'd0};
    reg[23:0] uart_tx_bytes = 24'b0;
    always @(posedge clk) begin
        uart_tx_bytes = con_timer;
    end

    //Secuencia de envio de datos
    always @(posedge clk) begin
        //Siempre y cuando no realicemos un reset
        if (!reset_uart) begin
            //Este case envia los 5 bytes del mensaje, los envia en orden segun la line de tx este libre 
            case(state_tx)
                STEPS_TX_0: begin
                    //En esta estapa enviamos el primer byte
                    uart_tx_data <= uart_tx_bytes[23:16];
                    state_tx <= (uart_tx_busy == 1'b0) ? STEPS_TX_1 : STEPS_TX_0;
                end
                STEPS_TX_1: begin
                    //En esta estapa enviamos el segundo byte
                    uart_tx_data <= uart_tx_bytes[15:8];
                    state_tx <= (uart_tx_busy == 1'b0) ? STEPS_TX_2 : STEPS_TX_1;
                end
                STEPS_TX_2: begin
                    //En esta estapa enviamos el tercer byte
                    uart_tx_data <= uart_tx_bytes[7:0];
                    state_tx <= (uart_tx_busy == 1'b0) ? STEPS_TX_3 : STEPS_TX_2;
                end
                STEPS_TX_3: begin
                    //En esta estapa enviamos el cuarto byte que sirve de fin de mensaje
                    uart_tx_data <= 8'b00001010;
                    state_tx <= (uart_tx_busy == 1'b0) ? STEPS_TX_0 : STEPS_TX_3;
                end
            endcase
        end
    end

    //Escritura de bytes de salida
    uart_tx tx(
        .i_clk(clk), //reloj 
        .i_resetn(~reset_uart), //reset
        .i_uart_tx_en(1'b1), //Habilitar desahabilitar el envio
        .i_uart_tx_data(uart_tx_data), //Datos a enviar
        .o_uart_txd(uart_tx), //Pin de envio de datos
        .o_uart_tx_busy(uart_tx_busy)//Para indicar que tx esta en uso
    );
    

    //---CON TIMER---
    
    //Este temporizador de un segundo manda su valor por el puerot serie a modo de callback lifeline the la comunicaion
    reg[31:0] second_count = 1_000_000_000 / 37;
    reg[31:0] clk_count = 23'b0;
    reg[23:0] con_timer;
    
    always @(posedge clk) begin
        //Realizamos el conteo cada segundo
        if(clk_count == second_count - 1)begin
            clk_count <= 20'b0;
            con_timer <= con_timer + 1;
        end else begin
            clk_count <= clk_count + 1'b1;
        end
        //Reseteamos el contador en caso de reset
        if(reset_uart) begin
            con_timer <= 0;
        end
    end

endmodule