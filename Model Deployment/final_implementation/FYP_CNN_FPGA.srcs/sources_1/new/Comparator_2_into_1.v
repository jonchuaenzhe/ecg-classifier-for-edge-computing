`timescale 1ns / 1ps

module Comparator_2_into_1#(
    parameter Bit_width = 16
)(
    input Clk,
    input signed [Bit_width - 1 : 0] Data_in_A,
    input signed [Bit_width - 1 : 0] reference_data,
    input [1:0] Latch_reset,
    output signed [Bit_width - 1 : 0] Data_out
);

    wire Latch;
    wire Reset;
    assign Latch = Latch_reset[1];
    assign Reset = Latch_reset[0];

    // maintain an internal memory of the reference data as we are not keeping all of it
    reg signed [Bit_width - 1 : 0] internal_ref;
    always @ (posedge Clk) begin
        if (Latch) begin
            internal_ref <= reference_data;
        end else if (Reset) begin
            internal_ref <= 0;
        end else begin
            internal_ref <= internal_ref;
        end
    end

    assign Data_out = (Data_in_A > internal_ref) ? Data_in_A : internal_ref;

endmodule