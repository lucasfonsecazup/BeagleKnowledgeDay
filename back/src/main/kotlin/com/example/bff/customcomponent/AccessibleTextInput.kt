package com.example.bff.customcomponent

import br.com.zup.beagle.annotation.RegisterWidget
import br.com.zup.beagle.widget.Widget
import java.awt.Color



@RegisterWidget
data class AccessibleTextInput(
        val hint: String,
        val placeHolder: String,
        val normalBorderColor: String,
        val selectedBorderColor: String,
        val type: String
): Widget()