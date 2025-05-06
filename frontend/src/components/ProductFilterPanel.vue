<template>
  <div class="filter-panel">
    <h2 class="filter-title">Filter</h2>
    <!-- Bộ lọc Name -->
    <div class="filter-group">
      <h3 class="filter-group-title">Name</h3>
      <div v-for="name in nameOptions" :key="name" class="filter-option">
        <input
          type="checkbox"
          :id="name"
          :value="name"
          v-model="selectedName"
          class="filter-checkbox"
          @change="emitFilters"
        />
        <label :for="name" class="filter-label">{{ name }}</label>
      </div>
    </div>
    <!-- Bộ lọc Price -->
    <div class="filter-group">
      <h3 class="filter-group-title">Price</h3>
      <div v-for="price in priceOptions" :key="price.label" class="filter-option">
        <input
          type="checkbox"
          :id="price.label"
          :value="price.range"
          v-model="selectedPrice"
          class="filter-checkbox"
          @change="emitFilters"
        />
        <label :for="price.label" class="filter-label">{{ price.label }}</label>
      </div>
    </div>
    <!-- Bộ lọc Storage -->
    <div class="filter-group">
      <h3 class="filter-group-title">Storage</h3>
      <div v-for="storage in storageOptions" :key="storage" class="filter-option">
        <input
          type="checkbox"
          :id="storage"
          :value="storage"
          v-model="selectedStorage"
          class="filter-checkbox"
          @change="emitFilters"
        />
        <label :for="storage" class="filter-label">{{ storage }}</label>
      </div>
    </div>
    <!-- Bộ lọc RAM -->
    <div class="filter-group">
      <h3 class="filter-group-title">RAM</h3>
      <div v-for="ram in ramOptions" :key="ram" class="filter-option">
        <input
          type="checkbox"
          :id="ram"
          :value="ram"
          v-model="selectedRam"
          class="filter-checkbox"
          @change="emitFilters"
        />
        <label :for="ram" class="filter-label">{{ ram }}</label>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      nameOptions: ['Galaxy Z', 'Galaxy S', 'Galaxy A'],
      selectedName: [],
      priceOptions: [
        { label: 'Below 10.000.000₫', range: { min: 0, max: 10000000 } },
        { label: '10.000.000₫ - 20.000.000₫', range: { min: 10000000, max: 20000000 } },
        { label: 'Above 20.000.000₫', range: { min: 20000000, max: Infinity } },
      ],
      selectedPrice: [],
      storageOptions: ['64GB', '128GB', '256GB', '512GB', '1TB'],
      selectedStorage: [],
      ramOptions: ['6GB', '8GB', '12GB'],
      selectedRam: [],
    };
  },
  methods: {
    emitFilters() {
      this.$emit('update:filters', {
        name: this.selectedName,
        price: this.selectedPrice,
        storage: this.selectedStorage,
        ram: this.selectedRam,
      });
    },
  },
};
</script>

<style scoped>
.filter-panel {
  font-family: 'Samsung Sharp Sans';
  width: 25%;
  padding: 16px;
  border-right: 1px solid #e0e0e0;
}
.filter-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 16px;
}
.filter-group {
  margin-bottom: 16px;
}
.filter-group-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 8px;
}
.filter-option {
  display: flex;
  align-items: center;
  margin-top: 8px;
}
.filter-checkbox {
  width: 20px;
  height: 20px;
  border: 2px solid #999;
  border-radius: 4px;
  appearance: none;
  cursor: pointer;
  position: relative;
}
.filter-checkbox:checked {
  background-color: #000;
  border-color: #000;
}
.filter-checkbox:checked::before {
  content: '✔';
  color: white;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 14px;
}
.filter-label {
  margin-left: 8px;
  font-size: 14px;
  cursor: pointer;
}
</style>