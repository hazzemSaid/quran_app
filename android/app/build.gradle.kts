plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // يجب أن يكون Flutter آخر Plugin يتم إضافته
}


android {
    namespace = "com.example.quran_app"
    compileSdk = 35 // تأكد من أن هذا متوافق مع Flutter
ndkVersion ="28.0.13004108"
    // ndkVersion = "25.2.9519653" // يمكنك تغييره حسب إصدار NDK لديك


    compileOptions {
         sourceCompatibility =JavaVersion.VERSION_1_8
        targetCompatibility= JavaVersion.VERSION_1_8
        isCoreLibraryDesugaringEnabled  = true
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.quran_app"
         minSdk = 21 // تأكد أنه متوافق مع `flutter.minSdkVersion`
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        // ✅ إضافة `coreLibraryDesugaringEnabled` هنا بدلاً من `compileOptions`
        multiDexEnabled = true
        // multiDexKeepProguard = file("multidex-config.pro")
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")

        }
    }
}

dependencies {
    implementation("androidx.window:window:1.0.0")
    implementation("androidx.window:window-java:1.0.0")

    // ✅ إصلاح `coreLibraryDesugaring`
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}

// ضبط مصدر كود Flutter
flutter {
    source = "../.."
}
