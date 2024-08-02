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



// Memoria de estados
always @(posedge clock) begin
    if (reset) begin
        state <= a;
    end else begin
        state <= nextstate;
    end
end


always @(*)begin
// Calculo de proximo estado y salidas
case (state)
    a:
        if (arrSensor) nextstate = b;
        else begin
            gateClose = 1;
            gateOpen = 0;
            gateBlock = 0;
            pinAlarm = 0;
            blockAlarm = 0;
            nextstate = a;
        end
    
    b: 
        if (password == corrPass && enter) begin
            gateOpen = 1;
            gateClose = 0;
            pinAlarm = 0;
            nextstate = c;
        end else if (password != corrPass && enter) nextstate = d;
        else if (arrSensor && entSensor) begin
            blockAlarm = 1;
            gateBlock = 1;
            gateOpen = 0;
            gateClose = 0;
            nextstate = h;
        end

    c:
        if (arrSensor) begin 
            nextstate = c;
            gateClose = 0;
            pinAlarm = 0;
            gateOpen = 1;
        end else if (entSensor) begin
            gateClose = 1;
            gateOpen = 0;
            nextstate = g;
        end else if (arrSensor && entSensor) begin
            gateBlock = 1;
            blockAlarm = 1;
            gateOpen = 0;
            gateClose = 0;
            nextstate = h;
        end

    d:
        if (password != corrPass && enter) nextstate = e;
        else if (password == corrPass && enter) nextstate = c;

    e:
        if (password != corrPass && enter) begin
            nextstate = f;
        end else if (password == corrPass && enter) nextstate = c;

    f:
        if (password != corrPass && enter) begin
            pinAlarm = 1;
            gateClose = 1;
            gateOpen = 0;
            nextstate = f;
        end
        else if (password == corrPass && enter) begin
            pinAlarm = 0;
            gateClose = 0;
            gateOpen = 1;
            nextstate = c;
        end

    g:
        if (entSensor && !arrSensor) begin
            gateClose = 1;
            gateOpen = 0;
            nextstate = a;
        end else if (entSensor && arrSensor) begin
            nextstate = h;
            gateBlock = 1;
            gateClose = 0;
            gateOpen = 0;
            blockAlarm = 1;
        end
    h:
        if(entSensor && arrSensor && enter && password != corrPass) begin
            nextstate = h;
            gateBlock = 1;
            gateClose = 0;
            gateOpen = 0;
            blockAlarm = 1;
        end else if (enter && password == corrPass) begin
            nextstate = b;
            gateBlock = 0;
            gateClose = 1;
            gateOpen = 0;
            blockAlarm = 0;
        end

endcase

end

endmodule