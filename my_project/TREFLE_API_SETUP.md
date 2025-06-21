# Trefle API Configuration

## Getting Started with Trefle API

### 1. Get Your API Key

1. Visit [Trefle.io](https://trefle.io/)
2. Sign up for a free account
3. Go to your dashboard and generate an API key
4. Copy your API key

### 2. Add Your API Key

Replace `YOUR_API_KEY_HERE` in the following file with your actual API key:

- `lib/features/plant/data/services/trefle_api_service.dart`

```dart
static const String apiKey = 'your_actual_api_key_here';
```

### 3. API Features Implemented

#### Plant Data Model (`TreflePlant`)

- Plant ID, common name, scientific name
- Family information
- Plant observations/descriptions
- Image URLs (when available)
- Edible information

#### API Service (`TrefleApiService`)

- **Get Plants**: Fetch plants with pagination
- **Search Plants**: Search by plant name
- **Get Plant by ID**: Fetch specific plant details
- **Mock Data**: Fallback when API is unavailable

#### Repository Pattern

- Handles API calls with error handling
- Automatic fallback to mock data
- Converts Trefle data to app's Plant model

#### UI Integration

- Loading states with progress indicators
- Error handling with retry functionality
- Network image loading with fallbacks
- Search functionality with debouncing
- Pagination support

### 4. Available Endpoints

The integration uses these Trefle API endpoints:

- `GET /api/v1/plants` - List plants
- `GET /api/v1/plants/{id}` - Get plant details
- `GET /api/v1/plants/search` - Search plants

### 5. Features in Your App

#### Home Screen Integration

- Displays real plant data in "Exclusive Offer" section
- Green eco icon in app bar leads to full API demo
- Automatic fallback to mock data if API fails

#### Trefle API Demo Page

- Full-featured plant browser
- Search functionality (minimum 3 characters)
- Infinite scroll with pagination
- Error handling and retry mechanisms
- Network image loading with placeholders

### 6. Usage Examples

```dart
// Get plants
final plants = await plantRepository.getPlants(page: 1, perPage: 20);

// Search plants
final searchResults = await plantRepository.searchPlants('rose');

// Get specific plant
final plant = await plantRepository.getPlantById(123);
```

### 7. Rate Limits

- Free tier: 120 requests per minute
- The app handles rate limiting gracefully with error messages

### 8. Testing

- Run the app and tap the green eco icon in the home screen
- Try searching for plants like "rose", "oak", "maple"
- Test pagination by scrolling to the bottom

### 9. Error Handling

- Network errors show retry buttons
- Invalid API keys display helpful error messages
- Automatic fallback to mock data ensures app always works
