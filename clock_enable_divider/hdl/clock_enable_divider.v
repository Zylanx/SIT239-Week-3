`timescale 1ns/1ns

module clock_enable_divider
	(
		input i_clk,
		
		output reg o_clk_en_half = 1'b0,
		output reg o_clk_en_quarter = 1'b0
	);

	// Counter that is incremented each clock cycle
	// Used in comparisons to drive the divided outputs
	reg [1:0] r_clk_counter = 2'b00;
	
	// Clock counter incrementer.
	// Each clock cycle will increment the clock counter by 1
	always @(posedge i_clk)
	begin
		r_clk_counter <= r_clk_counter + 1;
	end

	// Comparison block.
	// Compare bits of the counter to know when to drive outputs
	always @(posedge i_clk)
	begin
		// Default values
		o_clk_en_half <= 1'b0;
		o_clk_en_quarter <= 1'b0;
		
		if (r_clk_counter == 2'd1 || r_clk_counter == 2'd3)
		begin
			o_clk_en_half <= 1'b1;
		end
		
		if (r_clk_counter == 2'd3)
		begin
			o_clk_en_quarter <= 1'b1;
		end
	end
endmodule