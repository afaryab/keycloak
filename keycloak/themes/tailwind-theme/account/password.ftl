<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>
    <#if section = "content">
        <div class="bg-white shadow sm:rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-1">
                    ${msg("passwordTitle")}
                </h3>
                <p class="mt-1 text-sm text-gray-600 mb-6">
                    ${msg("passwordDescription")}
                </p>

                <form action="${url.passwordUrl}" method="post" class="space-y-6">
                    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

                    <#if password.passwordSet>
                        <div>
                            <label for="password" class="block text-sm font-medium text-gray-700">
                                ${msg("currentPassword")}
                            </label>
                            <div class="mt-1">
                                <input type="password" id="password" name="password" 
                                       autofocus 
                                       autocomplete="current-password"
                                       class="shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md">
                            </div>
                        </div>
                    </#if>

                    <div>
                        <label for="password-new" class="block text-sm font-medium text-gray-700">
                            ${msg("newPassword")}
                        </label>
                        <div class="mt-1">
                            <input type="password" id="password-new" name="password-new" 
                                   <#if !password.passwordSet>autofocus</#if>
                                   autocomplete="new-password"
                                   class="shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>

                    <div>
                        <label for="password-confirm" class="block text-sm font-medium text-gray-700">
                            ${msg("confirmPassword")}
                        </label>
                        <div class="mt-1">
                            <input type="password" id="password-confirm" name="password-confirm" 
                                   autocomplete="new-password"
                                   class="shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>

                    <div class="flex justify-end space-x-3">
                        <a href="${url.accountUrl}" 
                           class="inline-flex justify-center py-2 px-4 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                            ${msg("doCancel")}
                        </a>
                        <button type="submit" name="submitAction" value="Save"
                                class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                            ${msg("doSave")}
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <#if realm.userManagedAccessAllowed && features.authorization>
            <div class="mt-8 bg-white shadow sm:rounded-lg">
                <div class="px-4 py-5 sm:p-6">
                    <h3 class="text-lg leading-6 font-medium text-gray-900 mb-1">
                        ${msg("twoFactorAuth")}
                    </h3>
                    <p class="mt-1 text-sm text-gray-600 mb-6">
                        ${msg("totpDescription")}
                    </p>
                    
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <svg class="h-6 w-6 text-gray-400 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z"/>
                            </svg>
                            <span class="text-sm font-medium text-gray-900">${msg("totpTitle")}</span>
                        </div>
                        <a href="${url.totpUrl}" 
                           class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                            ${msg("totpSetupButton")}
                        </a>
                    </div>
                </div>
            </div>
        </#if>
    </#if>
</@layout.mainLayout>
