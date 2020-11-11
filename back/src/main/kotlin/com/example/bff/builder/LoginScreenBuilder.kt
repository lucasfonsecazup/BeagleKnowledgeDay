package com.example.bff.builder

import br.com.zup.beagle.core.CornerRadius
import br.com.zup.beagle.core.Style
import br.com.zup.beagle.ext.applyFlex
import br.com.zup.beagle.ext.applyStyle
import br.com.zup.beagle.ext.unitPercent
import br.com.zup.beagle.ext.unitReal
import br.com.zup.beagle.widget.action.Navigate
import br.com.zup.beagle.widget.action.Route
import br.com.zup.beagle.widget.core.*
import br.com.zup.beagle.widget.layout.Container
import br.com.zup.beagle.widget.layout.Screen
import br.com.zup.beagle.widget.layout.ScreenBuilder
import br.com.zup.beagle.widget.navigation.Touchable
import br.com.zup.beagle.widget.ui.*
import com.example.bff.customcomponent.AccessibleTextInput


class LoginScreenBuilder : ScreenBuilder {
    val BLUE = "#55BEF9"
    val GRAY = "#b7b7b7"
    val STYLE_TEXT_INPUT = "Style.TextInput"
    val STYLE_BUTTON_WHITE_SYSTEM_BOLD_16 = "Style.Button.White.Bold.16"
    val STYLE_TEXT_BOLD_SYSTEM_16 = "Style.Text.Bold.16"

    override fun build(): Screen {
        return Screen(child = Container(
                children = listOf(
                        image,
                        emailTextInput,
                        passwordTextInput,
                        passwordButton,
                        containerButton
                )
        ).applyStyle(Style(
                flex = Flex(alignItems = AlignItems.CENTER,
                        justifyContent = JustifyContent.CENTER,
                        grow = 1.0)
        )
        )
        )
    }

    private val image = Image(path = ImagePath.Local.justMobile("logo"))
            .applyStyle(Style(
                    size = Size(width = 250.unitReal(), height = 150.unitReal()),
                    margin = EdgeValue(top = 20.unitReal())
                 )
            )

    private val emailTextInput = TextInput(
            value = "",
            placeholder = "Email",
            type = TextInputType.EMAIL,
            styleId = STYLE_TEXT_INPUT
    ).applyStyle(style = Style(
            size = Size(width = 85.unitPercent(), height = 25.unitPercent()),
            margin = EdgeValue(top = 50.unitReal())
    )
    )

    private val passwordTextInput = AccessibleTextInput(
            hint = "Senha",
            placeHolder = "Digite sua senha",
            normalBorderColor = GRAY,
            selectedBorderColor = BLUE,
            type = TextInputType.PASSWORD.toString()
    )

//    private val passwordTextInput = TextInput(
//            value = "",
//            placeholder = "Senha",
//            type = TextInputType.PASSWORD,
//            styleId = STYLE_TEXT_INPUT
//    ).applyStyle(style = Style(
//            size = Size(width = 85.unitPercent(), height = 25.unitPercent()),
//            margin = EdgeValue(top = 20.unitReal())
//    )
//    )

    private val passwordButton = Container(
            children = listOf(
                    Touchable(
                            child = Text(
                                    text = "Esqueci minha senha",
                                    styleId = STYLE_TEXT_BOLD_SYSTEM_16,
                                    textColor       = BLUE
                            ).applyFlex(
                                    flex = Flex(alignSelf = AlignSelf.FLEX_START)
                            ),
                            onPress = listOf(
                                    Navigate.PushView(route = Route.Remote(url = "/password"))
                            )
                    )
            )
    ).applyStyle(
            Style(
                    size = Size(width = 85.unitPercent(), height = 20.unitPercent())
            )
    )

    private val loginButton = Button(
            text = "Entrar",
            styleId = STYLE_BUTTON_WHITE_SYSTEM_BOLD_16,
            onPress = listOf(
                    Navigate.OpenNativeRoute(route = "home")
            )
    ).applyStyle(style = Style(
            size = Size(width = 85.unitPercent(), height = 70.unitReal()),
            cornerRadius = CornerRadius(radius = 10.0),
            flex = Flex(alignSelf = AlignSelf.CENTER),
            backgroundColor = BLUE
    )
    )

    private val signUpButton = Button(
            text = "Cadastrar",
            styleId = STYLE_BUTTON_WHITE_SYSTEM_BOLD_16,
            onPress = listOf(
                    Navigate.PushView(route = Route.Remote(url = "/register"))
            )
    ).applyStyle(style = Style(
            size = Size(width = 75.unitPercent(), height = 70.unitReal()),
            cornerRadius = CornerRadius(radius = 10.0),
            flex = Flex(alignSelf = AlignSelf.CENTER),
            backgroundColor = BLUE
    )
    )

    private val containerButton = Container(
            children = listOf(
                    loginButton,
                    signUpButton
            )
    ).applyStyle(style = Style(
            margin = EdgeValue(top = 30.unitPercent()),
            size = Size(width = 100.unitPercent(), height = 100.unitPercent()),
            flex = Flex(justifyContent = JustifyContent.SPACE_BETWEEN, grow = 1.0)
    )
    )
}