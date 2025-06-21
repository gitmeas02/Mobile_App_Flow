# 🌱 Environment Variables Setup Guide

## Quick Setup

### 1. Edit your .env file

Your `.env` file is located at: `/mnt/mint-extra/ra-extra/Code/Mobile_App_Flow/my_project/.env`

Current content:

```
TREFLE_API_KEY=YOUR_ACTUAL_API_KEY_HERE
```

### 2. Get your Trefle API key

1. Visit [trefle.io](https://trefle.io/)
2. Sign up for a free account
3. Go to your profile/dashboard
4. Generate an API key
5. Copy the key

### 3. Replace the placeholder

Edit the `.env` file and replace `YOUR_ACTUAL_API_KEY_HERE` with your actual API key:

```
TREFLE_API_KEY=your_real_api_key_here
```

### 4. Restart the app

After updating the `.env` file, restart your Flutter app to load the new API key.

## Testing

### Without API Key (Mock Data)

- The app will show an amber banner: "Using Mock Data"
- You'll see 3 mock plants (Snake Plant, Monstera, Peace Lily)
- Search will work with the mock data

### With API Key (Real Data)

- The app will show a green banner: "API Key Configured!"
- You'll see real plant data from Trefle API
- Search will query the actual API
- Pagination will load more plants as you scroll

## Features Available

✅ **Environment variable configuration**  
✅ **Automatic fallback to mock data**  
✅ **API key validation**  
✅ **Visual status indicators**  
✅ **Search functionality**  
✅ **Pagination support**  
✅ **Network image loading**  
✅ **Error handling**

## Files Modified

- `pubspec.yaml` - Added flutter_dotenv dependency
- `main.dart` - Load environment variables on app start
- `.env` - Environment variables file
- `trefle_api_service.dart` - Use environment variables for API key
- `plant_repository.dart` - Check API key status
- `trefle_api_demo_page.dart` - Show API key status banner

## How to Access

1. Run your Flutter app
2. Tap the green eco icon (🌿) in the home screen header
3. You'll see the Trefle API demo page with status information
