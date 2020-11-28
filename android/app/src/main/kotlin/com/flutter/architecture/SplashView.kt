package com.flutter.architecture

import android.content.Context
import android.view.animation.Animation
import android.view.animation.AnimationUtils
import android.widget.FrameLayout


class SplashView constructor(context: Context)
    : FrameLayout(context), Animation.AnimationListener {
    lateinit var onTransitionComplete: Runnable

    init {
        val key = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
                .getString("flutter."+"themeKey", "light")
        val layout = if(key != null && key == "dark")
            R.layout.splash_dark else R.layout.splash
        inflate(context, layout, this)
    }

    fun animateAway(onTransitionComplete: Runnable){
        this.onTransitionComplete = onTransitionComplete
        val animation = AnimationUtils.loadAnimation(context, R.anim.alpha)
        animation.setAnimationListener(this)
        this.startAnimation(animation)
    }

    override fun onAnimationRepeat(p0: Animation?) {
    }

    override fun onAnimationEnd(p0: Animation?) {
        onTransitionComplete.run()
    }

    override fun onAnimationStart(p0: Animation?) {
    }
}