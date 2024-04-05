// Control game by simple RC-ADC.
localparam N = 32;

// General counter.
reg [N-1:0] counter;

// Output Signal.
reg T = 0;

// Count clock system.
always @(posedge clk)
begin
    counter <= counter + 1;
end

// We get enough time, active output.
always @(posedge counter[22])
begin
    T <= ~T;
    counter <= 0;
end

assign out_ply1 = T;

always @(posedge in_ply1)
begin
    pos_ply1 <= counter[9:0];
end

