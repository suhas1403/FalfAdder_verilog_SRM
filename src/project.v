/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_suhas1403_full_adder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (0=input, 1=output)
    input  wire       ena,      // goes high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n (active low)
);

    // Input mapping
    wire A    = ui_in[0];
    wire B    = ui_in[1];
    wire Cin  = ui_in[2];

    // Outputs
    assign uo_out[0] = A ^ B ^ Cin;                 // Sum
    assign uo_out[1] = (A & B) | (B & Cin) | (A & Cin); // Carry
    assign uo_out[7:2] = 6'b0; // unused outputs

    // No bidirectional IOs used
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
