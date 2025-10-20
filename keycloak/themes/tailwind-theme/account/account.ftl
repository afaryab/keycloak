<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>
    <#if section = "content">
        <div class="bg-white shadow sm:rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-1">
                    ${msg("editAccountTitle")}
                </h3>
                <p class="mt-1 text-sm text-gray-600 mb-6">
                    ${msg("personalInfoDescription")}
                </p>

                <form action="${url.accountUrl}" method="post" class="space-y-6">
                    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

                    <#if !realm.registrationEmailAsUsername>
                        <div>
                            <label for="username" class="block text-sm font-medium text-gray-700">
                                ${msg("username")}
                            </label>
                            <div class="mt-1">
                                <input type="text" id="username" name="username" 
                                       value="${(account.username!'')}" 
                                       <#if !realm.editUsernameAllowed>disabled</#if>
                                       class="shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md <#if !realm.editUsernameAllowed>bg-gray-100</#if>">
                            </div>
                        </div>
                    </#if>

                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">
                            ${msg("email")}
                        </label>
                        <div class="mt-1">
                            <input type="text" id="email" name="email" 
                                   value="${(account.email!'')}" 
                                   autofocus 
                                   class="shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-2">
                        <div>
                            <label for="firstName" class="block text-sm font-medium text-gray-700">
                                ${msg("firstName")}
                            </label>
                            <div class="mt-1">
                                <input type="text" id="firstName" name="firstName" 
                                       value="${(account.firstName!'')}" 
                                       class="shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md">
                            </div>
                        </div>

                        <div>
                            <label for="lastName" class="block text-sm font-medium text-gray-700">
                                ${msg("lastName")}
                            </label>
                            <div class="mt-1">
                                <input type="text" id="lastName" name="lastName" 
                                       value="${(account.lastName!'')}" 
                                       class="shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md">
                            </div>
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
    </#if>
</@layout.mainLayout>
