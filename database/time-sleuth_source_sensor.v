// This program was cloned from: https://github.com/chriz2600/time-sleuth
// License: MIT License

module sensor(
    input clock,
    input sensor,
    output reg sensor_out,
    output sensor_trigger
);

    reg prev_sensor_input = 0;
    
    always @(posedge clock) begin
        sensor_out <= ~sensor;
        prev_sensor_input <= sensor_out;
    end

    assign sensor_trigger = (~prev_sensor_input && sensor_out);

endmodule