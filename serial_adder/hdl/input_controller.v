module input_controller
	(
		input i_clk,
		input i_button,
		input [3:0] i_sliders,
		
		output reg [3:0] o_x_data = 4'b0000,
		output reg [3:0] o_y_data = 4'b0000,
		output reg o_cur_selection
	);
	
	// Button register for detecting clock synced edges
	reg r_button_delayed = 1'b0;
	
	// Button delay block
	always @(posedge i_clk) begin
		r_button_delayed <= i_button;
	end
	
	// Slider block
	always @(posedge i_clk) begin
		if (~o_cur_selection) begin
			o_x_data <= i_sliders;
		end
		else begin
			o_y_data <= i_sliders;
		end
	end
	
	// input_button block
	always @(posedge i_clk) begin
		// detect rising edge on input_button
		if (i_button && ~r_button_delayed) begin
			if (~o_cur_selection) begin
				o_cur_selection <= 1'b1;
			end
			else begin
				o_cur_selection <= 1'b0;
			end
		end
	end
	
endmodule