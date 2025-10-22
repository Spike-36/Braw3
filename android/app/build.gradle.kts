plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter Gradle Plugin must be applied after Android + Kotlin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // ==== IDENTIFIERS ====
    namespace = "com.petermilligan.wordkimchi"         // <-- FINAL package name
    // ==== SDK LEVELS (lock these; don't inherit) ====
    compileSdk = 34
    ndkVersion = flutter.ndkVersion

    // ==== JAVA / KOTLIN 17 ====
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.petermilligan.wordkimchi"  // <-- must match Play listing
        minSdk = 21
        targetSdk = 34
        // bump versionCode every Play upload; versionName is user-facing
        versionCode = 2
        versionName = "1.0.1"
    }

    // ==== SIGNING (reads android/key.properties) ====
    signingConfigs {
        create("release") {
            val props = java.util.Properties().apply {
                load(rootProject.file("key.properties").inputStream())
            }
            storeFile = file(props["storeFile"] as String)
            storePassword = props["storePassword"] as String
            keyAlias = props["keyAlias"] as String
            keyPassword = props["keyPassword"] as String
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
            // If you later enable minify, add proper ProGuard rules.
        }
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
