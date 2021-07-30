// create module
module blink_modified
	(
		input i_clk,  // 50MHz input clock
		output [7:0] o_led  // LED output
	);
	
	wire [10:0] ced_quarter;
	
	wire half;
	wire quarter;
	
	reg lengthen_quarter = 0;
	reg lengthen_half = 0;
	
	clock_enable_divider ced
	(
		.i_clk(i_clk),
		.i_clken(1'b1),
		.o_clk_en_half(o_led[1]),
		.o_clk_en_quarter(o_led[2])
		);

	always @(posedge i_clk)
	begin
		if (quarter)
		begin
			lengthen_quarter <= ~lengthen_quarter;
		end
		
		if (half)
		begin
			lengthen_half <= ~lengthen_half;
		end
	end
	
	assign o_led[0] = i_clk;
	assign o_led[7:3] = 5'd0;
endmodule