package com.flutter.architecture

import android.content.Context
import android.os.Bundle
import android.view.View
import io.flutter.embedding.android.SplashScreen

class SplashScreenPage : SplashScreen {
    lateinit var splashView: SplashView

    override fun createSplashView(context: Context, savedInstanceState: Bundle?): View? {
        splashView = SplashView(context)
        return splashView
    }

    override fun transitionToFlutter(onTransitionComplete: Runnable) {
        splashView.animateAway(onTransitionComplete)
    }

}