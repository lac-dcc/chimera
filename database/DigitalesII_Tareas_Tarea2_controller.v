// This program was cloned from: https://github.com/menesesj6/DigitalesII
// License: MIT License

module controller (
    input wire clock, reset,
    input wire arrSensor, entSensor, enter,
    input wire [7:0] password,
    output reg pinAlarm, blockAlarm, gateOpen, gateClose, gateBlock
);

reg [2:0] state;
reg [2:0] nextstate;
reg nextpinAlarm, nextblockAlarm, nextgateOpen, nextgateClose, nextgateBlock;

// Contrasena correcta
parameter corrPass = 8'b00101010;
// Estados
parameter a = 3'b000; // Esperando vehiculo
parameter b = 3'b001; // Esperando contrasena
parameter c = 3'b010; // Contrasena correcta
parameter d = 3'b011; // Contrasena incorrecta 1 vez
parameter e = 3'b100; // Contrasena incorrecta 2 veces
parameter f = 3'b101; // Contrasena incorrecta 3+ veces
parameter g = 3'b110; // Vehiculo ya entro
parameter h = 3'b111; // Compuerta bloqueada



// Memoria de estados y salidas, FFs
always @(posedge clock) begin
    if (reset) begin
        state <= a;
    end else begin
        state <= nextstate;
        pinAlarm <= nextpinAlarm;
        blockAlarm <= nextblockAlarm;
        gateOpen <= nextgateOpen;
        gateClose <= nextgateClose;
        gateBlock <= nextgateBlock;
    end
end


always @(*)begin
// Valores por defecto para cerrar comportamiento de los FF
    nextstate = state;
    nextpinAlarm = pinAlarm;
    nextblockAlarm = blockAlarm;
    nextgateOpen = gateOpen;
    nextgateClose = gateClose;
    nextgateBlock = gateBlock;
// Calculo de proximo estado y salidas
case (state)
    a:  
        begin
            nextpinAlarm = 0;
            nextblockAlarm = 0;
            nextgateOpen = 0;
            nextgateClose = 1;
            nextgateBlock = 0;
            if (arrSensor) nextstate = b;
        end
            
    b: 
        begin
            nextgateBlock = 0;
            nextgateClose = 1;
            nextgateOpen = 0;
            nextblockAlarm = 0;
            if (password == corrPass && enter) begin
                nextstate = c;
            end else if (password != corrPass && enter) nextstate = d;
            else if (arrSensor && entSensor) nextstate = h;
        end

    c:
        begin
            nextgateOpen = 1;
            nextgateClose = 0;
            nextpinAlarm = 0;
            if (entSensor) begin
                nextstate = g;
            end else if (arrSensor && entSensor) begin
                nextstate = h;
            end
        end

    d:
        if (password != corrPass && enter) nextstate = e;
        else if (password == corrPass && enter) nextstate = c;

    e:
        if (password != corrPass && enter) begin
            nextstate = f;
        end else if (password == corrPass && enter) nextstate = c;

    f:
        begin
            nextpinAlarm = 1;
            nextgateClose = 1;
            nextgateOpen = 0;
            if (password == corrPass && enter) begin
                nextstate = c;
            end
        end

    g:
        begin
            nextgateClose = 1;
            nextgateOpen = 0;
            if (entSensor && !arrSensor) begin
                nextstate = a;
            end else if (entSensor && arrSensor) begin
                nextstate = h;
            end
        end

    h:
        begin
            nextgateBlock = 1;
            nextgateClose = 0;
            nextgateOpen = 0;
            nextblockAlarm = 1;
        if (enter && password == corrPass) begin
            nextstate = b;
        end
        end

endcase

end

endmodule