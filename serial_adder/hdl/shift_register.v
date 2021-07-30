// Quartus Prime Verilog Template
// One-bit wide, N-bit long shift register

module shift_register
(
	input clk,
	input sr_in,
	input load,
	input [2:0] data,
	output sr_out,
	output [2:0] sr_p_out
);

	// Declare the shift register
	reg [2:0] sr = 3'b0;

	// Shift everything over, load the incoming bit
	always @ (posedge clk)
	begin
		if (load) begin
			sr <= {data[0], data[1], data[2]};
		end
		else begin
			sr[2:1] <= sr[1:0];
			sr[0] <= sr_in;
		end
	end

	// Catch the outgoing bit
	assign sr_out = sr[2];
	assign sr_p_out = {sr[0], sr[1], sr[2]};

endmodule
